//
//  Home+Reducer.swift
//  
//
//  Created by 小林聖人 on 2023/03/17.
//

import ComposableArchitecture
import Domain
import ResourcesFeature

extension Home: Reducer {
    public var body: some Reducer<State, Action> {
        DomainReducer()
    }
}
