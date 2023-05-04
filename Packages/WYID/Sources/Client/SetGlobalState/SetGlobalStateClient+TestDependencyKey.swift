//
//  SetGlobalStateClient+TestDependencyKey.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import Dependencies

extension DependencyValues {
    public var setGlobalStateClient: SetGlobalStateClient {
        get { self[SetGlobalStateClient.self] }
        set { self[SetGlobalStateClient.self] = newValue }
    }
}

extension SetGlobalStateClient: TestDependencyKey {
    public static let previewValue = Self.noop

    public static let testValue = Self.failure
}
