//
//  ResultModel.swift
//  iTunesApp
//
//  Created by Abdurrahman Karaoluk on 7.08.2022.
//

import Foundation

struct BaseModel: Codable {
    let resultCount: Int?
    let results: [ResultModel]? 
}

struct ResultModel: Codable {
    let wrapperType, kind: String?
    let artistID, collectionID: Int?
    let artistName, collectionName, trackName: String?
    let artistViewURL: String?
    let artworkUrl100: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind, artworkUrl100
        case artistID = "artistId"
        case collectionID = "collectionId"
        case artistName, collectionName, trackName
        case artistViewURL = "artistViewUrl"
        
    }
}
