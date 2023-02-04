//
//  TestData.swift
//  WenderlichTests
//
//  Created by Brian Slick on 2/3/23.
//

import Foundation


let testDataSingleArticle: Data = """
{
    "data" : [
                        {
                            "id" : "10628623",
                            "type" : "contents",
                            "attributes" : {
                                "uri" : "rw://koenig/post/255285",
                                "name" : "Mac Catalyst with Andy Pereira – Podcast S10 E7",
                                "description" : "Dru flips the switch on his 50th show with Andy Pereira telling us how easy Catalyst can be. After Dru talks about transitioning from developer to architect.",
                                "released_at" : "2020-05-20T18:01:43.000Z",
                                "free" : true,
                                "difficulty" : "intermediate",
                                "content_type" : "article",
                                "duration" : 60,
                                "popularity" : 1366,
                                "technology_triple_string" : "Swift 5, iOS 13, Xcode 11",
                                "contributor_string" : "Dru Freeman",
                                "ordinal" : null,
                                "professional" : false,
                                "description_plain_text" : "Dru flips the switch on his 50th show with Andy Pereira telling us how easy Catalyst can be. After Dru talks about transitioning from developer to architect.",
                                "video_identifier" : null,
                                "parent_name" : null,
                                "card_artwork_url" : "https://koenig-media.raywenderlich.com/uploads/2016/02/Logo.png"
                            },
                            "relationships" : {
                                "domains" : {
                                    "data" : [
                                        {
                                            "id" : "1",
                                            "type" : "domains"
                                        },
                                        {
                                            "id" : "7",
                                            "type" : "domains"
                                        }
                                    ]
                                },
                                "child_contents" : {
                                    "meta" : {
                                        "count" : 0
                                    }
                                },
                                "progression" : {
                                    "data" : null
                                },
                                "bookmark" : {
                                    "data" : null
                                }
                            },
                            "links" : {
                                "self" : "http://api.raywenderlich.com/api/contents/10628623-mac-catalyst-with-andy-pereira-podcast-s10-e7"
                            }
                        }
    ]
}
""".data(using: .utf8)!


let testDataSingleVideo: Data = """
{
    "data" : [
                        {
                "id" : "9529598",
                "type" : "contents",
                "attributes" : {
                    "uri" : "rw://betamax/collections/244",
                    "name" : "VS Code Tips & Tricks",
                    "description" : "<p>Become a VS Code power user with tips and tricks such as keyboard shortcuts, editing tips and utilizing the goodness of extensions.</p>",
                    "released_at" : "2020-06-02T13:00:00.000Z",
                    "free" : false,
                    "difficulty" : "beginner",
                    "content_type" : "collection",
                    "duration" : 3119,
                    "popularity" : 1.8,
                    "technology_triple_string" : "Dart 2.7, Flutter 1.12, VS Code 1.43",
                    "contributor_string" : "Adriana Kutenko & Emmanuel Okiche",
                    "ordinal" : null,
                    "professional" : false,
                    "description_plain_text" : "Become a VS Code power user with tips and tricks such as keyboard shortcuts, editing tips and utilizing the goodness of extensions.",
                    "video_identifier" : null,
                    "parent_name" : null,
                    "card_artwork_url" : "https://files.betamax.raywenderlich.com/attachments/collections/244/e2d20345-06fb-42f4-8366-c7ffe80b5f77.png"
                },
                "relationships" : {
                    "domains" : {
                        "data" : [
                            {
                                "id" : "9",
                                "type" : "domains"
                            }
                        ]
                    },
                    "child_contents" : {
                        "meta" : {
                            "count" : 10
                        }
                    },
                    "progression" : {
                        "data" : null
                    },
                    "bookmark" : {
                        "data" : null
                    }
                },
                "links" : {
                    "self" : "http://api.raywenderlich.com/api/contents/9529598-vs-code-tips-tricks"
                }
            }
    ]
}
""".data(using: .utf8)!
