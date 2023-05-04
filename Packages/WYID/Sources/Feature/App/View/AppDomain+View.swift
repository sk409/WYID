//
//  AppDomain+View.swift
//  
//
//  Created by 小林聖人 on 2023/03/17.
//

import ComposableArchitecture
import Domain
import HomeFeature
import SwiftUI

extension AppDomain {
    public struct View: SwiftUI.View {
        private let store: StoreOf<AppDomain>

        public var body: some SwiftUI.View {
            Home.View(
                store: store.scope(
                    state: \.homeState,
                    action: Action.home
                )
            )
        }

        public init(store: StoreOf<AppDomain>) {
            self.store = store
        }
    }
}
