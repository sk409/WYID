//
//  IntentHandler+SelectPhotoIntentHandling.swift
//  Intent
//
//  Created by 小林聖人 on 2023/03/17.
//

import Intents

extension IntentHandler: SelectPhotoIntentHandling {
    func providePhotoOptionsCollection(
        for intent: SelectPhotoIntent
    ) async throws -> INObjectCollection<Photo> {
        let photo = Photo(identifier: "i", display: "写真ですよ", subtitle: nil, image: INImage(url: URL(string: "https://placekitten.com/400/400")!))
        let photo2 = Photo(identifier: "i2", display: "写真ですよ2", subtitle: nil, image: INImage(url: URL(string: "https://placekitten.com/400/400")!))
        return .init(items: [photo, photo2])
    }
}
