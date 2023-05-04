//
//  ClientEnvironment.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import Dependencies
import SwiftUI

@dynamicMemberLookup
public struct ClientEnvironment<Client> {
    @Dependency private var client: Client

    public init(keyPath: KeyPath<DependencyValues, Client>) {
        self._client = .init(keyPath)
    }

    public subscript<Value>(dynamicMember keyPath: KeyPath<Client, Value>) -> Value {
        client[keyPath: keyPath]
    }
}
