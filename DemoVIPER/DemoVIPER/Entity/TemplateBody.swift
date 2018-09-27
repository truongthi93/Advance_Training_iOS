//
//  TemplateBody.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class TemplateBody: Mappable {
    var iframeProperty: IframeProperty?
    var templateLines: [TemplateLinesItem]? = []
    var templateType: String? = ""
    
    init() {
    }
    
    init(iframeProperty: IframeProperty,templateLines: [TemplateLinesItem], templateType: String) {
        self.iframeProperty = iframeProperty
        self.templateLines = templateLines
        self.templateType = templateType
    }
    
    required init?(map: Map) {
        //Optional
        iframeProperty <- map["iframeProperty"]
        templateLines <- (map["templateLines"], ArrayTransform())
        templateType <- map["templateType"]

    }
    
    func mapping(map: Map) {
        //Optional
        iframeProperty <- map["iframeProperty"]
        templateLines <- (map["templateLines"], ArrayTransform())
        templateType <- map["templateType"]
    }
}
