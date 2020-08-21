//
//  Constants.swift
//  Dummy
//
//  Created by Dummy on 15/05/19.
//  Copyright © 2019 Dummy. All rights reserved.
//

import Foundation
import UIKit

// MARK:- Screen Sizes
struct ScreenSize {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}

//MARK: - URL
struct UrlName {
    static let baseUrl = "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json"
    
}

// MARK:- Colour
struct Color {
    static let primaryColor = "#700000"
    static let backgroundColor = "#f4f6fd"
}

// MARK: - AlertField Names
struct AlertField {
    static let appTitle = "Sample"
    static let oopsString = "OOPS!!!"
    static let okString = "Ok"
    static let cancelString = "Cancel"
    static let loaderString = "Loading"
    static let alertString = "Alert!"
    static let noInternetString = "Seems like your internet services are disabled, please go to Settings and turn on Internet Services."
}
