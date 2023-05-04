//
//  GetGlobalStateClient+EnvironmentKey.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import DependencyHelpers
import SwiftUI

extension EnvironmentValues {
    public var getGlobalStateClient: ClientEnvironment<GetGlobalStateClient> {
        get { self[ClientEnvironment<GetGlobalStateClient>.self] }
        set { self[ClientEnvironment<GetGlobalStateClient>.self] = newValue }
    }
}

extension ClientEnvironment: EnvironmentKey where Client == GetGlobalStateClient {
    public static let defaultValue = ClientEnvironment(keyPath: \.getGlobalStateClient)
}
