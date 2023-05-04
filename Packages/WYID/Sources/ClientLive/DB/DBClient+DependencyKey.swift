//
//  DBClient+DependencyKey.swift
//  
//
//  Created by 小林聖人 on 2023/03/21.
//

import DBClient
import Dependencies

extension DBClient: DependencyKey {
    public static let liveValue = Self.live()
}
