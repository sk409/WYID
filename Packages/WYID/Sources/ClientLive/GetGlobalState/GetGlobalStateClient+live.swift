//
//  GetGlobalStateClient+live.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import Dependencies
import Entity
import GlobalState
import GetGlobalStateClient

extension GetGlobalStateClient {
    public static func live(globalStateStore: GlobalStateStore) -> Self {
        .init(
            globalState: {
                globalStateStore.globalState
            },
            globalStateStream: {
                globalStateStore.values(\.self)
            },
            photos: {
                globalStateStore.globalState.photos
            },
            photosStream: {
                globalStateStore.values(\.photos)
            }
        )
    }
}
