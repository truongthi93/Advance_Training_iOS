//
//  TemplateBody.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class TemplateBody: Object, Mappable {
    
    var iframeProperty: [IframeProperty]? = []
    var templateLines: [TemplateLinesItem]? = []
    var templateType: String? = ""
    
    func mapping(map: Map) {
        templateType <- map["iframeProperty"]
        templateType <- map["templateLines"]
        templateType <- map["templateType"]
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
}
