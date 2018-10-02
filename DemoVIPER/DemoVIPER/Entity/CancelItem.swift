//
//  CancelItem.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class CancelItem: Mappable {
    var state: String? = ""
    var textKey: String? = ""
    var action: Int? = 0
    var icon: String? =  ""

    init(state: String, textKey: String, action: Int, icon: String) {
        self.state = state
        self.textKey = textKey
        self.action = action
        self.icon = icon
    }
    
    required init?(map: Map) {
        //String
        state <- map["state"]
        textKey <- map["textKey"]
        action <- map["action"]
        icon <- map["icon"]
    }
    
    func mapping(map: Map) {
        //String
        state <- map["state"]
        textKey <- map["textKey"]
        action <- map["action"]
        icon <- map["icon"]
    }
}
