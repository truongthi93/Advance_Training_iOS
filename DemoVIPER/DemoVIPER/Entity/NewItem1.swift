//
//  NewItem1.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class NewItem1: NSObject, Mappable {
    var state: String? = ""
    var textKey: String? = ""
    var action: Int? = 0
    var icon: Int? = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
    
}

