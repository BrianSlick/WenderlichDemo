//
//  Constants.swift
//  Wenderlich
//
//  Created by Brian Slick on 2/4/23.
//

import Foundation

struct Constants {
    static var dateFormatter: ISO8601DateFormatter {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions =  [.withInternetDateTime, .withFractionalSeconds]
        return dateFormatter
    }
}
