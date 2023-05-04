//
//  GetGlobalStateClient+DependencyKey.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import Dependencies
import GetGlobalStateClient

extension GetGlobalStateClient: DependencyKey {
    public static let liveValue = Self.live(globalStateStore: .mock)
}
