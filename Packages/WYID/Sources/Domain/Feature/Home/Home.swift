//
//  Home.swift
//  
//
//  Created by 小林聖人 on 2023/03/17.
//

import Foundation

public struct Home {
    public struct State: Equatable {
        public var tab: Tab

        public var resourcesState: Resources.State

        public var widgetsState: Widgets.State

        public init(
            tab: Tab = .widgets,
            resourcesState: Resources.State = .init(),
            widgetsState: Widgets.State = .init()
        ) {
            self.tab = tab
            self.resourcesState = resourcesState
            self.widgetsState = widgetsState
        }
    }

    public enum Action: Equatable {
        case selectTab(Tab)

        case resources(Resources.Action)
        case widgets(Widgets.Action)
    }

    public init() {}
}

#if DEBUG

extension Home.State {
    public static let mock = Self(
        tab: .widgets,
        resourcesState: .mock,
        widgetsState: .mock
    )
}

#endif
