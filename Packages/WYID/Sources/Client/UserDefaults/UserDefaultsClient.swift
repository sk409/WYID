//
//  UserDefaultsClient.swift
//  
//
//  Created by 小林聖人 on 2023/03/21.
//

import Foundation
import XCTestDynamicOverlay

public struct UserDefaultsClient {
    public var loadData: (String) -> Data?
    public var setData: (String, Data) async -> Void

    public init(
        loadData: @escaping (String) -> Data?,
        setData: @escaping (String, Data) async -> Void
    ) {
        self.loadData = loadData
        self.setData = setData
    }
}

extension UserDefaultsClient {
    public static let noop = Self(
        loadData: { _ in .init() },
        setData: { _, _ in }
    )

    public static let failure = Self(
        loadData: unimplemented("\(Self.self).loadData"),
        setData: unimplemented("\(Self.self).setData")
    )
}
