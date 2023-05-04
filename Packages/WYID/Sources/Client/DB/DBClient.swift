//
//  DBClient.swift
//  
//
//  Created by 小林聖人 on 2023/03/21.
//

import Entity
import Foundation
import Helpers
import XCTestDynamicOverlay

public struct DBClient {
    public var photos: () -> [Photo]?
    public var savePhotos: ([Photo]) async throws -> Void

    public init(
        photos: @escaping () -> [Photo]?,
        savePhotos: @escaping ([Photo]) async throws -> Void
    ) {
        self.photos = photos
        self.savePhotos = savePhotos
    }
}

extension DBClient {
    public static let noop = Self(
        photos: { nil },
        savePhotos: { _ in }
    )

    public static let failure = Self(
        photos: unimplemented("\(Self.self).photos"),
        savePhotos: unimplemented("\(Self.self).savePhotos")
    )
}
