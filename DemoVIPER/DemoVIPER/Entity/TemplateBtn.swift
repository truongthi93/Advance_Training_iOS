//
//  TemplateBtn.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class TemplateBtn: Mappable {
    var cancel: [CancelItem]? = nil
    var complete: [CompleteItem]? = nil
    var expire: [ExpireItem]? = nil
    var fail: [FailItem]? = nil
    var new: [NewItem]? = []
    var labelSet: String? = ""
    
    init(cancel: [CancelItem], complete: [CompleteItem], expire: [ExpireItem], fail: [FailItem], new: [NewItem], labelSet: String) {
        self.cancel = cancel
        self.complete = complete
        self.expire = expire
        self.fail = fail
        self.new = new
        self.labelSet = labelSet
    }
    
    required init?(map: Map) {
        //Optional
        cancel <- (map["cancel"], ArrayTransform())
        complete <- (map["complete"], ArrayTransform())
        expire <- (map["expire"], ArrayTransform())
        fail <- (map["fail"], ArrayTransform())
        new <- (map["new"], ArrayTransform())
        //String
        labelSet <- map["labelSet"]
    }
    
    func mapping(map: Map) {
        //Optional
        cancel <- (map["cancel"], ArrayTransform())
        complete <- (map["complete"], ArrayTransform())
        expire <- (map["expire"], ArrayTransform())
        fail <- (map["fail"], ArrayTransform())
        new <- (map["new"], ArrayTransform())
        //String
        labelSet <- map["labelSet"]
    }
}

