//
//  WithGlobalState.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import Combine
import Dependencies
import DependencyHelpers
import GetGlobalStateClient
import GlobalState
import SwiftUI

public struct WithGlobalState<
    GlobalViewState: Equatable,
    Content: View
>: View {
    private let toGlobalViewState: (GlobalState) -> GlobalViewState
    private let content: (GlobalViewState) -> Content

    @Environment(\.getGlobalStateClient) private var getGlobalStateClient

    public var body: some View {
        ContentView(
            getGlobalStateClient: getGlobalStateClient,
            toGlobalViewState: toGlobalViewState,
            content: content
        )
    }

    public init(
        toGlobalViewState: @escaping (GlobalState) -> GlobalViewState,
        @ViewBuilder content: @escaping (GlobalViewState) -> Content
    ) {
        self.toGlobalViewState = toGlobalViewState
        self.content = content
    }
}

extension WithGlobalState {
    struct ContentView: View {
        private let content: (GlobalViewState) -> Content

        @ObservedObject private var viewModel: WithGlobalStateViewModel<GlobalViewState>

        var body: some View {
            content(viewModel.globalViewState)
                .task {
                    await viewModel.subscribe()
                }
        }

        init(
            getGlobalStateClient: ClientEnvironment<GetGlobalStateClient>,
            toGlobalViewState: @escaping (GlobalState) -> GlobalViewState,
            @ViewBuilder content: @escaping (GlobalViewState) -> Content
        ) {
            self.content = content
            self.viewModel = .init(
                getGlobalStateClient: getGlobalStateClient,
                toGlobalViewState: toGlobalViewState
            )
        }
    }
}

class WithGlobalStateViewModel<GlobalViewState: Equatable>: NSObject, ObservableObject {
    private(set) var globalViewState: GlobalViewState

    private let getGlobalStateClient: ClientEnvironment<GetGlobalStateClient>
    private let toGlobalViewState: (GlobalState) -> GlobalViewState

    init(
        getGlobalStateClient: ClientEnvironment<GetGlobalStateClient>,
        toGlobalViewState: @escaping (GlobalState) -> GlobalViewState
    ) {
        self.globalViewState = toGlobalViewState(getGlobalStateClient.globalState())
        self.getGlobalStateClient = getGlobalStateClient
        self.toGlobalViewState = toGlobalViewState
    }

    func subscribe() async {
        for await globalState in getGlobalStateClient.globalStateStream() {
            let globalViewState = toGlobalViewState(globalState)
            guard globalViewState != self.globalViewState else {
                continue
            }
            self.globalViewState = globalViewState
            objectWillChange.send()
        }
    }
}

