//
//  ResourcesClient.swift
//  
//
//  Created by 小林聖人 on 2023/03/20.
//

import CoreTransferable
import Entity
import Foundation
import Helpers
import PhotosUI
import SwiftUI
import XCTestDynamicOverlay

public struct ResourcesClient {
    public var loadPhotos: @Sendable ([PhotosPickerItem]) async throws -> [Photo]

    public init(
        loadPhotos: @Sendable @escaping ([PhotosPickerItem]) async throws -> [Photo]
    ) {
        self.loadPhotos = loadPhotos
    }
}

extension ResourcesClient {
    public static let noop = Self(
        loadPhotos: { _ in [] }
    )

    public static let failure = Self(
        loadPhotos: unimplemented("\(Self.self).loadPhotos")
    )
}
