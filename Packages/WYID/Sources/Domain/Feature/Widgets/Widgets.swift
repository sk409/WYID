//
//  Widgets.swift
//  
//
//  Created by 小林聖人 on 2023/03/18.
//

import Foundation

public struct Widgets {
    public struct State: Equatable {
        public init() {}
    }

    public enum Action: Equatable {}

    public init() {}
}

#if DEBUG

extension Widgets.State {
    public static let mock = Self()
}

#endif
