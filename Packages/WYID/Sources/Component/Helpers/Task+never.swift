//
//  Task+never.swift
//  
//
//  Created by 小林聖人 on 2023/03/20.
//

import Foundation

extension Task where Failure == Never {
    /// An async function that never returns.
    static func never() async throws -> Success {
        for await element in AsyncStream<Success>.never {
            return element
        }
        throw _Concurrency.CancellationError()
    }
}
