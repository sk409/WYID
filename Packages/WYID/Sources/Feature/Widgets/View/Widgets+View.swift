//
//  Widgets+View.swift
//  
//
//  Created by 小林聖人 on 2023/03/18.
//

import ComposableArchitecture
import Domain
import SwiftUI

extension Widgets {
    public struct View: SwiftUI.View {
        @ObservedObject private var viewStore: ViewStoreOf<Widgets>

        private let store: StoreOf<Widgets>

        public var body: some SwiftUI.View {
            Text("Widgets")
        }

        public init(
            store: StoreOf<Widgets>
        ) {
            self.viewStore = ViewStore(store, observe: { $0 })
            self.store = store
        }
    }
}
