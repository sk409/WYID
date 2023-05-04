//
//  Resources.swift
//  
//
//  Created by 小林聖人 on 2023/03/18.
//

import ComposableArchitecture
import Entity
import Foundation
import PhotosUI
import SwiftUI

public struct Resources{
    public struct State: Equatable {
        @BindingState public var selectedPhotos: [PhotosPickerItem]
        @PresentationState public var destination: Destination.State?

        public init(
            selectedPhotos: [PhotosPickerItem] = [],
            destination: Destination.State? = nil
        ) {
            self.selectedPhotos = selectedPhotos
            self.destination = destination
        }
    }

    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case transition(Destination.State?)
        case destination(PresentationAction<Destination.Action>)
    }

    public enum AlertAction: Equatable {
        case none
    }

    public struct Destination {
        public enum State: Equatable {
            case alert(AlertState<AlertAction>)
            case photosPicker

            public var alertState: AlertState<AlertAction>? {
                (/Self.alert).extract(from: self)
            }
        }

        public enum Action: Equatable {
            case alert(AlertAction)
        }
    }

    public init() {}
}

#if DEBUG

extension Resources.State {
    public static let mock = Self()
}

#endif
