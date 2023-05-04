//
//  GetGlobalStateClient+TestDependencyKey.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import Dependencies

extension DependencyValues {
    public var getGlobalStateClient: GetGlobalStateClient {
        get { self[GetGlobalStateClient.self] }
        set { self[GetGlobalStateClient.self] = newValue }
    }
}

extension GetGlobalStateClient: TestDependencyKey {
    public static let previewValue = Self.noop

    public static let testValue = Self.failure
}
