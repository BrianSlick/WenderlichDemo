//
//  FeedItem.swift
//  Wenderlich
//
//  Created by Brian Slick on 2/2/23.
//

import Foundation

enum ContentType: String {
    case unknown
    case article
    case video = "collection"
}

struct FeedItem {
    let name: String
    let artworkURL: URL?
    let itemDescription: String
    let releaseDate: Date
    let contentType: ContentType
}


extension FeedItem {
    init(feedJSONItem: FeedJSONItem) {
        let attributes = feedJSONItem.attributes
        
        let contentType: ContentType
        if let content = ContentType(rawValue: attributes.content_type) {
            contentType = content
        } else {
            contentType = .unknown
        }
        
        let releaseDate: Date

        if let date = Constants.dateFormatter.date(from: attributes.released_at) {
            releaseDate = date
        } else {
            releaseDate = Date()
        }
        
        self.init(name: attributes.name,
                  artworkURL: URL(string: attributes.card_artwork_url),
                  itemDescription: attributes.description_plain_text,
                  releaseDate: releaseDate,
                  contentType: contentType)
    }
}
