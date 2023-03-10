//
//  FeedDownloader.swift
//  Wenderlich
//
//  Created by Brian Slick on 2/5/23.
//

import Foundation

enum FeedDownloaderError: Error {
    case fileLoadError
    case fileNotFoundError
}

class FeedDownloader {
    func downloadArticles() async throws -> Data {
        if let path = Bundle.main.url(forResource: "articles", withExtension: "json") {
            return try await download(from: path)
        } else {
            throw FeedDownloaderError.fileNotFoundError
        }
    }
    
    func downloadVideos() async throws -> Data {
        if let path = Bundle.main.url(forResource: "videos", withExtension: "json") {
            return try await download(from: path)
        } else {
            throw FeedDownloaderError.fileNotFoundError
        }
    }
    
    fileprivate func download(from path: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: path)
            return data
        } catch {
            throw FeedDownloaderError.fileLoadError
        }
    }
}
