//
//  Photo.swift
//  
//
//  Created by 小林聖人 on 2023/03/21.
//

import Foundation

public struct Photo: Codable, Equatable, Identifiable {
    public let url: URL

    public var id: URL {
        url
    }

    public init(
        url: URL
    ) {
        self.url = url
    }
}
