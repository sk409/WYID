//
//  Home+View.swift
//  
//
//  Created by 小林聖人 on 2023/03/17.
//

import ComposableArchitecture
import Domain
import ResourcesFeature
import SwiftUI
import WidgetsFeature

extension Home {
    public struct View: SwiftUI.View {
        @ObservedObject private var viewStore: ViewStoreOf<Home>

        private let store: StoreOf<Home>

        public var body: some SwiftUI.View {
            TabView(
                selection: viewStore.binding(
                    get: \.tab,
                    send: Action.selectTab
                )
            ) {
                NavigationStack {
                    Widgets.View(
                        store: store.scope(
                            state: \.widgetsState,
                            action: Action.widgets
                        )
                    )

                }
                .tag(Tab.widgets)
                .tabItem {
                    Text("アルバム")
                }

                NavigationStack {
                    Resources.View(
                        store: store.scope(
                            state: \.resourcesState,
                            action: Action.resources
                        )
                    )

                }
                .tag(Tab.resources)
                .tabItem {
                    Text("写真")
                }
            }
        }

        public init(
            store: StoreOf<Home>
        ) {
            self.viewStore = ViewStore(store, observe: { $0 })
            self.store = store
        }
    }
}

#if DEBUG

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home.View(
            store: .init(
                initialState: .mock,
                reducer: Home()
            )
        )
    }
}

#endif
