//
//  FeedParserTests.swift
//  WenderlichTests
//
//  Created by Brian Slick on 2/3/23.
//

import XCTest
@testable import Wenderlich

final class FeedParserTests: XCTestCase {

    var expectedArticleFeedStructure: FeedJSONStructure?
    var expectedVideoFeedStructure: FeedJSONStructure?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let testArticleAttributes = FeedJSONAttributes(
            name: "Mac Catalyst with Andy Pereira – Podcast S10 E7",
            description_plain_text: "Dru flips the switch on his 50th show with Andy Pereira telling us how easy Catalyst can be. After Dru talks about transitioning from developer to architect.",
            released_at: "2020-05-20T18:01:43.000Z",
            content_type: "article",
            card_artwork_url: "https://koenig-media.raywenderlich.com/uploads/2016/02/Logo.png")
        
        let testVideoAttributes = FeedJSONAttributes(
            name: "VS Code Tips & Tricks",
            description_plain_text: "Become a VS Code power user with tips and tricks such as keyboard shortcuts, editing tips and utilizing the goodness of extensions.",
            released_at: "2020-06-02T13:00:00.000Z",
            content_type: "collection",
            card_artwork_url: "https://files.betamax.raywenderlich.com/attachments/collections/244/e2d20345-06fb-42f4-8366-c7ffe80b5f77.png"
        )
        
        let testArcticleItem = FeedJSONItem(attributes: testArticleAttributes)
        let testVideoItem = FeedJSONItem(attributes: testVideoAttributes)
        
        expectedArticleFeedStructure = FeedJSONStructure(data: [testArcticleItem])
        expectedVideoFeedStructure = FeedJSONStructure(data: [testVideoItem])
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParserParsesArticleFeedStructure() throws {
        let parser = FeedParser()
        
        let result = try parser.parse(testDataSingleArticle)
        
        XCTAssertEqual(expectedArticleFeedStructure, result)
    }

    func testParserParsesVideoFeedStructure() throws {
        let parser = FeedParser()
        
        let result = try parser.parse(testDataSingleVideo)
        
        XCTAssertEqual(expectedVideoFeedStructure, result)
    }
    
    func testParserThrowsParseErrorForInvalidJSON() throws {
        let inputString = "gagjaklsdfjkslafjdsa"
        let testData = inputString.data(using: .utf8)!
        
        let parser = FeedParser()
        var thrownError: Error?
        
        XCTAssertThrowsError(try parser.parse(testData)) {
            thrownError = $0
        }
        
        XCTAssertTrue(thrownError is ParserError, "Unexpected error type")
    }
}
