//
//  TemplateBtn.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class TemplateBtn: Object, Mappable {
    var cancel: [CancelItem]? = nil
    var complete: [CompleteItem]? = nil
    var expire: [ExpireItem]? = nil
    var fail: [FailItem]? = nil
    var new: [NewItem]? = []
    var labelSet: String? = ""
 
    func mapping(map: Map) {
        cancel <- map["cancel"]
        complete <- map["complete"]
        expire <- map["expire"]
        fail <- map["fail"]
        new <- map["new"]
        labelSet <- map["labelSet"]
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
}

