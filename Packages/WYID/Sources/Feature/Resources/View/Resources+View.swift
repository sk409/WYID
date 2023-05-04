//
//  Resources+View.swift
//  
//
//  Created by 小林聖人 on 2023/03/18.
//

import CasePaths
import ComposableArchitecture
import Domain
import GlobalStateView
import PhotosUI
import SwiftUI

extension Resources {
    public struct View: SwiftUI.View {
        @ObservedObject private var viewStore: ViewStoreOf<Resources>

        private let store: StoreOf<Resources>

        public var body: some SwiftUI.View {
            WithGlobalState(toGlobalViewState: GlobalViewState.init) { globalViewState in
                GeometryReader { geometry in
                    Grid(horizontalSpacing: 2, verticalSpacing: 2) {
                        ForEach(globalViewState.photos) { photo in
                            GridRow {
                                AsyncImage(url: photo.url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width / 3, height: geometry.size.width / 3)
                                        .clipped()
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup {
                    VStack(alignment: .center, spacing: 2) {
                        Image(systemName: "plus")
                            .font(.callout)
                        Text("追加")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                    .onTapGesture {
                        viewStore.send(.transition(.photosPicker))
                    }
                }
            }
            .photosPicker(
                isPresented: viewStore.binding(
                    get: { $0.destination == .photosPicker },
                    send: .destination(.dismiss)
                ),
                selection: viewStore.binding(\.$selectedPhotos),
                matching: .images
            )
            .alert(
                store: store.scope(
                    state: \.$destination,
                    action: Action.destination
                ),
                state: \.alertState,
                action: { .alert($0) }
            )
        }

        public init(
            store: StoreOf<Resources>
        ) {
            self.viewStore = ViewStore(store, observe: { $0 })
            self.store = store
        }
    }
}

#if DEBUG

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Resources.View(
                store: .init(
                    initialState: .mock,
                    reducer: Resources()
                )
            )
        }
    }
}

#endif
