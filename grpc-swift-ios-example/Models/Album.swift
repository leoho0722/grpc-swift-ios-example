//
//  Album.swift
//  grpc-swift-ios-example
//
//  Created by Leo Ho on 2023/12/22.
//

import Foundation

struct Album {
    
    let id: String
    
    let title: String
    
    let artist: String
    
    let releaseDate: String
    
    init(id: String = UUID().uuidString,
         title: String,
         artist: String,
         releaseDate: String) {
        self.id = id
        self.title = title
        self.artist = artist
        self.releaseDate = releaseDate
    }
}
