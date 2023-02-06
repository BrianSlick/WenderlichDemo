//
//  DataManager.swift
//  Wenderlich
//
//  Created by Brian Slick on 2/5/23.
//

import Foundation


protocol FeedProvider {
    func articles() async throws -> [FeedItem]
    func videos() async throws -> [FeedItem]
    func allItems() async throws -> [FeedItem]
}

class DataManager: FeedProvider {
    static let shared = DataManager()
    
    private var articleFeed: [FeedItem] = []
    private var videoFeed: [FeedItem] = []
    
    func articles() async throws -> [FeedItem] {
        if articleFeed.isEmpty == false {
            return articleFeed
        }
        
        do {
            let data = try await FeedDownloader().downloadArticles()
            let feedJSONStructure = try FeedParser().parse(data)
            
            if let feedJSONStructure {
                let feed = feedJSONStructure.data.map({
                    return FeedItem(feedJSONItem: $0)
                })
                articleFeed = feed.sorted(by: { $0.releaseDate > $1.releaseDate })
                return articleFeed
            }
            
        } catch let error {
            throw error
        }
        
        return []
    }
    
    func videos() async throws -> [FeedItem] {
        if videoFeed.isEmpty == false {
            return videoFeed
        }
        
        do {
            let data = try await FeedDownloader().downloadVideos()
            let feedJSONStructure = try FeedParser().parse(data)
            
            if let feedJSONStructure {
                let feed = feedJSONStructure.data.map({
                    return FeedItem(feedJSONItem: $0)
                })
                videoFeed = feed.sorted(by: { $0.releaseDate > $1.releaseDate })
                return videoFeed
            }
            
        } catch let error {
            throw error
        }
        
        return []
    }
    
    func allItems() async throws -> [FeedItem] {
        do {
            let articles = try await articles()
            let videos = try await videos()
            let feed = articles + videos
            return feed.sorted(by: { $0.releaseDate > $1.releaseDate })
        } catch let error {
            throw error
        }
    }
}
