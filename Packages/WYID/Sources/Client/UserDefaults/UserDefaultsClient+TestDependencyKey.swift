//
//  UserDefaultsClient+TestDependencyKey.swift
//  
//
//  Created by 小林聖人 on 2023/03/21.
//

import Dependencies

extension DependencyValues {
    public var userDefaultsClient: UserDefaultsClient {
        get { self[UserDefaultsClient.self] }
        set { self[UserDefaultsClient.self] = newValue }
    }
}

extension UserDefaultsClient: TestDependencyKey {
    public static let previewValue = Self.noop

    public static let testValue = Self.failure
}
