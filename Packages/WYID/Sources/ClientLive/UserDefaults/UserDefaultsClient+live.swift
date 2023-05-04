//
//  UserDefaultsClient+live.swift
//  
//
//  Created by 小林聖人 on 2023/03/21.
//

import Foundation
import UserDefaultsClient

extension UserDefaultsClient {
    public static func live(userDefaults: UserDefaults) -> Self {
        .init(
            loadData: {
                Self.loadData(
                    key: $0,
                    userDefaults: userDefaults
                )
            },
            setData: {
                Self.setData(key: $0, data: $1, userDefaults: userDefaults)
            }
        )
    }

    private static func loadData(
        key: String,
        userDefaults: UserDefaults
    ) -> Data? {
        userDefaults.data(forKey: key)
    }

    private static func setData(
        key: String,
        data: Data,
        userDefaults: UserDefaults
    ) {
        userDefaults.set(data, forKey: key)
    }
}
