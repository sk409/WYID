//
//  DBClient+TestDependencyKey.swift
//  
//
//  Created by 小林聖人 on 2023/03/21.
//

import Dependencies

extension DependencyValues {
    public var dbClient: DBClient {
        get { self[DBClient.self] }
        set { self[DBClient.self] = newValue }
    }
}

extension DBClient: TestDependencyKey {
    public static let previewValue = Self.noop

    public static let testValue = Self.failure
}
