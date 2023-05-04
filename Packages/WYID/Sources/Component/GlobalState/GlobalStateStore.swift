//
//  GlobalStateStore.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import Combine
import Dependencies
import Foundation

public class GlobalStateStore: NSObject {
    public var globalState: GlobalState {
        currentValueSubject.value
    }

    private let currentValueSubject: CurrentValueSubject<GlobalState, Never>
    private let queue = DispatchQueue(label: "\(GlobalStateStore.self)")

    @Dependency(\.mainQueue) private var mainQueue

    public init(globalState: GlobalState) {
        self.currentValueSubject = .init(globalState)
    }

    public func values<Value: Equatable>(_ keyPath: KeyPath<GlobalState, Value>) -> AsyncStream<Value> {
        currentValueSubject
            .map(keyPath)
            .removeDuplicates()
            .receive(on: mainQueue)
            .values
            .eraseToStream()
    }

    public func update(operation: (inout GlobalState) -> Void) {
        queue.sync {
            var globalState = self.globalState
            operation(&globalState)
            currentValueSubject.send(globalState)
        }
    }
}

extension GlobalStateStore {
    public static let mock = GlobalStateStore(globalState: .mock)
}
