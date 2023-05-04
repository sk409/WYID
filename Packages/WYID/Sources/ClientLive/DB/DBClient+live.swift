//
//  DBClient+live.swift
//  
//
//  Created by 小林聖人 on 2023/03/21.
//

import Combine
import DBClient
import Dependencies
import Entity
import Foundation
import UserDefaultsClient

extension DBClient {
    public static func live() -> Self {
        @Dependency(\.userDefaultsClient) var userDefaultsClient

        return .init(
            photos: {
                Self.photos(userDefaultsClient: userDefaultsClient)
            },
            savePhotos: {
                try await Self.savePhotos(
                    photos: $0,
                    userDefaultsClient: userDefaultsClient
                )
            }
        )
    }

    private static let photosKey = "photos"

    private static func photos(userDefaultsClient: UserDefaultsClient) -> [Photo]? {
        userDefaultsClient.loadData(photosKey).flatMap {
            try? JSONDecoder().decode([Photo].self, from: $0)
        }
    }

    private static func savePhotos(
        photos: [Photo],
        userDefaultsClient: UserDefaultsClient
    ) async throws {
        await userDefaultsClient.setData(Self.photosKey, try JSONEncoder().encode(photos))
    }
}
