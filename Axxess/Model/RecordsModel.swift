//
//  GameModel.swift
//  ECGame
//
//  Created by hfcb on 14/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import ObjectMapper

class RecordsModel: Mappable {
    
    var id : String?
    var type : String?
    var date : String?
    var data : String?
    
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        type <- map["type"]
        date <- map["date"]
        data <- map["data"]
    }
}

