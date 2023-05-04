//
//  ResourcesClient+live.swift
//  
//
//  Created by 小林聖人 on 2023/03/20.
//

import DBClient
import Dependencies
import Entity
import Foundation
import PhotosUI
import ResourcesClient
import SwiftUI

extension ResourcesClient {
    public static let live = Self(
        loadPhotos: {
            try await Self.loadPhotos(items: $0)
        }
    )

    private static func loadPhotos(items: [PhotosPickerItem]) async throws -> [Photo] {
        try await withThrowingTaskGroup(of: Optional<Photo>.self) { taskGroup in
            items.forEach { item in
                taskGroup.addTask {
                    guard let photoTransferable = try await item.loadTransferable(type: PhotoTransferable.self) else {
                        return nil
                    }
                    return .init(url: photoTransferable.url)
                }
            }
            return try await taskGroup.reduce(into: []) { $0.append($1) }.compactMap { $0 }
        }
    }
}
