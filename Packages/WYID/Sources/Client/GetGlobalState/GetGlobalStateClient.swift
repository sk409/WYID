//
//  GetGlobalStateClient.swift
//
//
//  Created by 小林聖人 on 2023/05/04.
//

import Entity
import GlobalState
import XCTestDynamicOverlay

public struct GetGlobalStateClient {
    public var globalState: () -> GlobalState
    public var globalStateStream: () -> AsyncStream<GlobalState>
    public var photos: () -> [Photo]
    public var photosStream: () -> AsyncStream<[Photo]>

    public init(
        globalState: @escaping () -> GlobalState,
        globalStateStream: @escaping () -> AsyncStream<GlobalState>,
        photos: @escaping () -> [Photo],
        photosStream: @escaping () -> AsyncStream<[Photo]>
    ) {
        self.globalState = globalState
        self.globalStateStream = globalStateStream
        self.photos = photos
        self.photosStream = photosStream
    }
}

extension GetGlobalStateClient {
    public static let noop = Self(
        globalState: { .mock },
        globalStateStream: { .never },
        photos: { [] },
        photosStream: { .never }
    )

    public static let failure = Self(
        globalState: unimplemented("\(Self.self).globalState"),
        globalStateStream: unimplemented("\(Self.self).globalStateStream"),
        photos: unimplemented("\(Self.self).photos"),
        photosStream: unimplemented("\(Self.self).photosStream")
    )
}
