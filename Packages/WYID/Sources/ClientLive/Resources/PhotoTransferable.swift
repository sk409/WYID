//
//  Photo.swift
//  
//
//  Created by 小林聖人 on 2023/03/18.
//

import CoreTransferable

struct PhotoTransferable: Transferable {
    let url: URL

    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .image) {
            SentTransferredFile($0.url)
        } importing: { received in
            guard let copy = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.append(path: "photos") else {
                return nil
            }
            try FileManager.default.copyItem(at: received.file, to: copy)
            return Self(url: copy)
        }
    }
}
