//
//  Resources+CoreReducer.swift
//  
//
//  Created by 小林聖人 on 2023/03/21.
//

import ComposableArchitecture
import DBClient
import Dependencies
import Domain

extension Resources {
    struct CoreReducer: Reducer {
        func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
            switch action {
            case let .binding(bindingAction):
                return BindingStateReducer().reduce(into: &state, action: bindingAction)

            case let .transition(destination):
                state.destination = destination
                return .none

            case .destination:
                return .none
            }
        }
    }
}
