//
//  App+Reducer.swift
//  
//
//  Created by 小林聖人 on 2023/03/17.
//

import ComposableArchitecture
import Domain

extension App {
    public struct Reducer: ReducerProtocol {
        public var body: some ReducerOf<App> {
            EmptyReducer()
        }
    }
}
