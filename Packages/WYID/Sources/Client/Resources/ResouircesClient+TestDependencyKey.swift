//
//  ResouircesClient+TestDependencyKey.swift
//  
//
//  Created by 小林聖人 on 2023/03/20.
//

import Dependencies

extension DependencyValues {
    public var resourcesClient: ResourcesClient {
        get { self[ResourcesClient.self] }
        set { self[ResourcesClient.self] = newValue }
    }
}

extension ResourcesClient: TestDependencyKey {
    public static let previewValue = Self.noop

    public static let testValue = Self.failure
}
