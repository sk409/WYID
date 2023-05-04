//
//  Home+DomainReducer.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import ComposableArchitecture
import Domain

extension Home {
    struct DomainReducer: Reducer {
        var body: some Reducer<State, Action> {
            CoreReducer()

            Scope(state: \.resourcesState, action: /Action.resources) {
                Resources()
            }
        }
    }
}

