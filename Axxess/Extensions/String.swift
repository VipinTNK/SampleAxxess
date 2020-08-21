//
//  String.swift
//  ECGame
//
//  Created by hfcb on 03/03/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import Foundation


extension String {
    func addSpaceToString()->String {
        return "     "+self+"     "
    }
    
    func appendDollorSymbol()->String {
        return "$ " + self
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension Date {
    static func randomDate(range: Int) -> Date {
        // Get the interval for the current date
        let interval =  Date().timeIntervalSince1970
        // There are 86,400 milliseconds in a day (ignoring leap dates)
        // Multiply the 86,400 milliseconds against the valid range of days
        let intervalRange = Double(86_400 * range)
        // Select a random point within the interval range
        let random = Double(arc4random_uniform(UInt32(intervalRange)) + 1)
        // Since this can either be in the past or future, we shift the range
        // so that the halfway point is the present
        let newInterval = interval + (random - (intervalRange / 2.0))
        // Initialize a date value with our newly created interval
        return Date(timeIntervalSince1970: newInterval)
    }
    
    func toString() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }

    func getYearBackDateString(yearago : Int) -> String
    {
        let tInterval = 60*60*24*365*yearago
        let currDate = Date(timeIntervalSinceNow: TimeInterval(-tInterval))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: currDate)
    }
}
