//
//  JSONTests.swift
//  WenderlichTests
//
//  Created by Brian Slick on 2/3/23.
//

import XCTest
@testable import Wenderlich

final class JSONTests: XCTestCase {
    
    let testName = "Name"
    let testDescription = "Test Description"
    let testReleasedAt = "2020-05-20T18:01:43.000Z"
    let testContentType = "article"
    let testArtworkURLString = "http://www.apple.com"
    
    var basicAttributesItem: FeedJSONAttributes?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        basicAttributesItem = FeedJSONAttributes(
            name: testName,
            description_plain_text: testDescription,
            released_at: testReleasedAt,
            content_type: testContentType,
            card_artwork_url: testArtworkURLString
        )
        
    }
    
    // MARK: - FeedJSONAttributes Tests
        
    func testAttribuesItemHasName() throws {
        XCTAssertEqual(testName, basicAttributesItem?.name)
    }
    
    func testAttributesItemHasDescription() throws {
        XCTAssertEqual(testDescription, basicAttributesItem?.description_plain_text)
    }
    
    func testAttributesItemHasReleasedAt() throws {
        XCTAssertEqual(testReleasedAt, basicAttributesItem?.released_at)
    }
    
    func testAttributesItemHasContentType() throws {
        XCTAssertEqual(testContentType, basicAttributesItem?.content_type)
    }
    
    func testAttributesItemHasArtworkURL() throws {
        XCTAssertEqual(testArtworkURLString, basicAttributesItem?.card_artwork_url)
    }
    
    // MARK: - FeedJSONItem Tests
    
    func testItemHasAttributes() throws {
        let feedItem = FeedJSONItem(attributes: basicAttributesItem!)
        
        XCTAssertEqual(basicAttributesItem, feedItem.attributes)
    }
    
    // MARK: - FeedJSONStructure Tests
    
    func testStructureHasData() throws {
        let feedItem = FeedJSONItem(attributes: basicAttributesItem!)

        let structure = FeedJSONStructure(data: [feedItem])
        
        XCTAssertEqual([feedItem], structure.data)
    }
}
