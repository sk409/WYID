//
//  Home+CoreReducer.swift
//  
//
//  Created by 小林聖人 on 2023/03/18.
//

import ComposableArchitecture
import Domain

extension Home {
    struct CoreReducer: Reducer {
        func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
            switch action {
            case let .selectTab(tab):
                state.tab = tab
                return .none

            case .resources:
                return .none

            case .widgets:
                return .none
            }
        }
    }
}
