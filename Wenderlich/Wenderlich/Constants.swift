//
//  Constants.swift
//  Wenderlich
//
//  Created by Brian Slick on 2/4/23.
//

import Foundation

struct Constants {
    static var serverDateFormatter: ISO8601DateFormatter {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions =  [.withInternetDateTime, .withFractionalSeconds]
        return dateFormatter
    }
    
    static var displayDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter
    }
}
