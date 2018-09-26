//
//  ContentTemplate.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class ContentTemplate: Object, Mappable {
    
    var templateBody: [TemplateBody]? = []
    var templateBtn: [TemplateBtn]? = []
    var templateID: String? = ""
    var templateVersion: Int = 0
    
    
    func mapping(map: Map) {
        templateBody <- map["templateBody"]
        templateBtn <- map["templateBtn"]
        templateID <- map["templateID"]
        templateVersion <- map["templateVersion"]
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
}
