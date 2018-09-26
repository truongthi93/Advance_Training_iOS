//
//  ContentTemplate.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class ContentTemplate: NSObject, Mappable {
    
    var templateBody: [TemplateBody]? = []
    var templateBtn: [TemplateBtn]? = []
    var templateID: String? = ""
    var templateVersion: Int = 0
    
    
    override init() {
    }
    
    init(templateBody: [TemplateBody], templateBtn: [TemplateBtn], templateID: String, templateVersion: Int) {
        self.templateBody = templateBody
        self.templateBtn = templateBtn
        self.templateID = templateID
        self.templateVersion = templateVersion
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        //Optional
        templateBody <- (map["templateBody"], ArrayTransform())
        templateBtn <- (map["templateBtn"], ArrayTransform())
        //String
        templateID <- map["templateID"]
        templateVersion <- map["templateVersion"]
    }
}
