//
//  UserDefaultsClient+DependencyKey.swift
//  
//
//  Created by 小林聖人 on 2023/03/21.
//

import Dependencies
import UserDefaultsClient

extension UserDefaultsClient: DependencyKey {
    public static let liveValue = Self.live(userDefaults: .standard)
}
