//
//  AppDomain.swift
//  
//
//  Created by 小林聖人 on 2023/03/17.
//

import Foundation

public struct AppDomain {
    public struct State: Equatable {
        public var homeState: Home.State

        public init(homeState: Home.State) {
            self.homeState = homeState
        }
    }

    public enum Action: Equatable {
        case home(Home.Action)
    }

    public init() {}
}
