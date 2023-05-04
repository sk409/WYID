//
//  WYIDApp.swift
//  WYID
//
//  Created by 小林聖人 on 2023/03/16.
//

import AppFeature
import ComposableArchitecture
import Domain
import SwiftUI

@main
struct WYIDApp: App {
    private let store = Store(
        initialState: .init(
            homeState: .init()
        ),
        reducer: AppDomain()
    )

    var body: some Scene {
        WindowGroup {
            AppDomain.View(store: store)
        }
    }
}
