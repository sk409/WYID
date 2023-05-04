//
//  Resources+Reducer.swift
//  
//
//  Created by 小林聖人 on 2023/03/18.
//

import ComposableArchitecture
import Domain

extension Resources: Reducer {
    public var body: some Reducer<State, Action> {
        DomainReducer()
    }
}
