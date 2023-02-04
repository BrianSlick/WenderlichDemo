//
//  FeedParser.swift
//  Wenderlich
//
//  Created by Brian Slick on 2/3/23.
//

import Foundation

enum ParserError: Error {
    case decodeError
}

struct FeedParser {
    func parse(_ data: Data) throws -> FeedJSONStructure? {
        let decoder = JSONDecoder()

        do {
            let feedStructure = try decoder.decode(FeedJSONStructure.self, from: data)
            return feedStructure
        } catch {
            throw ParserError.decodeError
        }
    }
}
