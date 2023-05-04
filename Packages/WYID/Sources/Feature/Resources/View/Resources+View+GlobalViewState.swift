//
//  Resources+View+GlobalViewState.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import Domain
import Entity
import Foundation
import GlobalState

extension Resources {
    struct GlobalViewState: Equatable {
        let photos: [Photo]

        init(_ globalState: GlobalState) {
            self.photos = globalState.photos
        }
    }
}
