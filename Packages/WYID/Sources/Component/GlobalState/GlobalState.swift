//
//  GlobalState.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import Entity
import Foundation

public struct GlobalState: Equatable {
    public var photos: [Photo]
}

extension GlobalState {
    public static let mock = Self(
        photos: []
    )
}
