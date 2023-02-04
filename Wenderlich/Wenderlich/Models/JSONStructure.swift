//
//  JSONStructure.swift
//  Wenderlich
//
//  Created by Brian Slick on 2/3/23.
//

import Foundation


struct FeedJSONStructure: Decodable, Equatable {
    let data: [FeedJSONItem]
}

struct FeedJSONItem: Decodable, Equatable {
    let attributes: FeedJSONAttributes
}

struct FeedJSONAttributes: Decodable, Equatable {
    let name: String
    let description_plain_text: String
    let released_at: String
    let content_type: String
    let card_artwork_url: String
}
