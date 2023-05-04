//
//  Resources+DomainReducer.swift
//  
//
//  Created by 小林聖人 on 2023/05/04.
//

import ComposableArchitecture
import Domain

extension Resources {
    struct DomainReducer: Reducer {
        var body: some Reducer<State, Action> {
            BindingReducer()

            CoreReducer()
        }
    }
}
