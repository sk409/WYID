//
//  Home.swift
//  
//
//  Created by 小林聖人 on 2023/03/17.
//

import Foundation

public enum Home: Domain {
    public struct State: Equatable {
        public var tab: Tab

        
    }

    public enum Action {
        case selectTab(Tab)
    }
}

#if DEBUG

extension Home.State {
    public static let mock = Self(
        tab: .widgets
    )
}

#endif
