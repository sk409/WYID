//
//  Resources+BindingStateReducer.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import ComposableArchitecture
import Domain
import PhotosUI
import ResourcesClient
import SetGlobalStateClient
import SwiftUI

extension Resources {
    struct BindingStateReducer {
        @Dependency(\.resourcesClient) private var resourcesClient
        @Dependency(\.setGlobalStateClient) private var setGlobalStateClient

        func reduce(into state: inout State, action: BindingAction<State>) -> EffectTask<Action> {
            switch action {
            case \.$selectedPhotos:
                return selectedPhotosReduce(into: &state, selectedPhotos: state.selectedPhotos)
            default:
                return .none
            }
        }

        private func selectedPhotosReduce(into state: inout State, selectedPhotos: [PhotosPickerItem]) -> EffectTask<Action> {
            .run { send in
                let photos = try await resourcesClient.loadPhotos(selectedPhotos)
                try await setGlobalStateClient.setPhotos {
                    $0.append(contentsOf: photos)
                }
                if photos.count != selectedPhotos.count {
                    await send(.transition(.alert(.init(
                        title: .init("追加に失敗した写真があります"),
                        message: .init("追加に失敗した写真をもう一度追加してください。")
                    ))))
                }
            }
        }
    }
}
