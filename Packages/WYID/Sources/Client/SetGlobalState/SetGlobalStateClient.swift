//
//  SetGlobalStateClient.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import Entity
import Foundation
import XCTestDynamicOverlay

public struct SetGlobalStateClient {
    public var setPhotos: (@escaping (inout [Photo]) -> Void) async throws -> Void

    public init(setPhotos: @escaping (@escaping (inout [Photo]) -> Void) async throws -> Void) {
        self.setPhotos = setPhotos
    }
}

extension SetGlobalStateClient {
    public static let noop = Self(
        setPhotos: { _ in }
    )

    public static let failure = Self(
        setPhotos: unimplemented("\(Self.self).setPhotos")
    )
}
