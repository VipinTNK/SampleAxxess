//
//  CommanDateFomatter.swift
//  ECGame
//
//  Created by hfcb on 3/11/20.
//  Copyright © 2020 iOS TNK. All rights reserved.
//

import Foundation

public class CommanDateFomatter: NSObject {
    
    private let dateFormatter = DateFormatter()
    
    override init() {
        super.init()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    // Get Current Date
    public func currentTime() -> String {
        
        let date = Date().getCurrentMonth()
        return dateFormatter.string(from: date!)
    }
    // Get Previous Month Date
    public func previousMonthTime() -> String {
        
        let date = Date().getPreviousMonth()
        return dateFormatter.string(from: date!)
    }
}
