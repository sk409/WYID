//
//  AppDomain+DomainReducer.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import ComposableArchitecture
import Domain
import HomeFeature

extension AppDomain {
    struct DomainReducer: Reducer {
        var body: some Reducer<State, Action> {
            Scope(state: \.homeState, action: /Action.home) {
                Home()
            }
        }
    }
}
