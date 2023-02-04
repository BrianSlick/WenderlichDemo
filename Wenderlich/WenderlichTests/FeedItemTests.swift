//
//  FeedItemTests.swift
//  WenderlichTests
//
//  Created by Brian Slick on 2/2/23.
//

import XCTest
@testable import Wenderlich

final class FeedItemTests: XCTestCase {
    
    let testName = "Name"
    let testArtworkURL = URL(string: "http://www.google.com")!
    let testItemDescription = "Test Description"
    let testDate = Date()
    let testContentType = ContentType.article
    
    var basicTestFeedItem: FeedItem?
    var testFeedItemWithNils: FeedItem?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        basicTestFeedItem = FeedItem(
            name: testName,
            artworkURL: testArtworkURL,
            itemDescription: testItemDescription,
            releaseDate: testDate,
            contentType: testContentType
        )
        
        testFeedItemWithNils = FeedItem(
            name: testName,
            artworkURL: nil,
            itemDescription: testItemDescription,
            releaseDate: testDate,
            contentType: testContentType
        )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFeedItemHasName() throws {
        XCTAssertEqual(testName, basicTestFeedItem?.name)
    }

    func testFeedItemHasArtworkURL() throws {
        XCTAssertEqual(testArtworkURL, basicTestFeedItem?.artworkURL)
    }

    func testArtworkURLStringIsOptional() throws {
        XCTAssertNotNil(testFeedItemWithNils)
        XCTAssertEqual(nil, testFeedItemWithNils?.artworkURL)
    }
    
    func testFeedItemHasItemDescription() throws {
        XCTAssertEqual(testItemDescription, basicTestFeedItem?.itemDescription)
    }
    
    func testFeedItemHasReleaseDate() throws {
        XCTAssertEqual(testDate, basicTestFeedItem?.releaseDate)
    }
    
    func testFeedItemHasContentType() throws {
        XCTAssertEqual(testContentType, basicTestFeedItem?.contentType)
    }
    
    func testFeedItemCanBeInitializedWithArticleJSONItem() throws {
        let name = "Mac Catalyst with Andy Pereira – Podcast S10 E7"
        let description = "Dru flips the switch on his 50th show with Andy Pereira telling us how easy Catalyst can be. After Dru talks about transitioning from developer to architect."
        let url = URL(string: "https://koenig-media.raywenderlich.com/uploads/2016/02/Logo.png")!
        let dateString = "2020-05-20T18:01:43.000Z"
        let releaseDate = Constants.dateFormatter.date(from: dateString)!
        let data = testDataSingleArticle
        let parser = FeedParser()
        let structure = try parser.parse(data)!
        
        let feedAttribute = structure.data[0]
        
        let sut = FeedItem(feedJSONItem: feedAttribute)
                
        XCTAssertEqual(name, sut.name)
        XCTAssertEqual(description, sut.itemDescription)
        XCTAssertEqual(ContentType.article, sut.contentType)
        XCTAssertEqual(url, sut.artworkURL)
        XCTAssertEqual(releaseDate, sut.releaseDate)
    }
    
    func testFeedItemCanBeInitializedWithVideoJSONItem() throws {
        let name = "VS Code Tips & Tricks"
        let description = "Become a VS Code power user with tips and tricks such as keyboard shortcuts, editing tips and utilizing the goodness of extensions."
        let url = URL(string: "https://files.betamax.raywenderlich.com/attachments/collections/244/e2d20345-06fb-42f4-8366-c7ffe80b5f77.png")!
        let dateString = "2020-06-02T13:00:00.000Z"
        let releaseDate = Constants.dateFormatter.date(from: dateString)!
        let data = testDataSingleVideo
        let parser = FeedParser()
        let structure = try parser.parse(data)!
        
        let feedAttribute = structure.data[0]
        
        let sut = FeedItem(feedJSONItem: feedAttribute)
                
        XCTAssertEqual(name, sut.name)
        XCTAssertEqual(description, sut.itemDescription)
        XCTAssertEqual(ContentType.video, sut.contentType)
        XCTAssertEqual(url, sut.artworkURL)
        XCTAssertEqual(releaseDate, sut.releaseDate)
    }

}
