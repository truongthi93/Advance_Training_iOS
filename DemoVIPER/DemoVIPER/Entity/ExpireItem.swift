//
//  Expire.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class ExpireItem: Object, Mappable {
    var state: String? = ""
    var textKey: String? = ""
    var action: Int? = 0
    var icon: Int? = 0
    
    func mapping(map: Map) {
        state <- map["state"]
        textKey <- map["textKey"]
        action <- map["action"]
        icon <- map["icon"]
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
}

