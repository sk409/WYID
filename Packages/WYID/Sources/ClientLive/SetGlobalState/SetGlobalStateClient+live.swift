//
//  SetGlobalStateClient+live.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import DBClient
import Dependencies
import Entity
import GlobalState
import SetGlobalStateClient

extension SetGlobalStateClient {
    public static func live(globalStateStore: GlobalStateStore) -> Self {
        @Dependency(\.dbClient) var dbClient

        return .init(
            setPhotos: {
                try await Self.setPhotos(
                    globalStateStore: globalStateStore,
                    operation: $0,
                    dbClient: dbClient
                )
            }
        )
    }

    private static func setPhotos(
        globalStateStore: GlobalStateStore,
        operation: (inout [Photo]) -> Void,
        dbClient: DBClient
    ) async throws {
        globalStateStore.update {
            operation(&$0.photos)
        }
        try await dbClient.savePhotos(globalStateStore.globalState.photos)
    }
}
