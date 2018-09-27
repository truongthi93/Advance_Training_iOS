//
//  Images.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class IframeProperty: Mappable{
    
    var images: [String]? = []
    var templateLines: [TemplateLinesItem]? = []

    init(images: [String], templateLines: [TemplateLinesItem]) {
        self.images = images
        self.templateLines = templateLines
    }
    
    required init?(map: Map) {
        //Optional
        templateLines <- (map["templateLines"], ArrayTransform())
        //String
        images <- map["images"]
    }
    
    func mapping(map: Map) {
        //Optional
        templateLines <- (map["templateLines"], ArrayTransform())
        //String
        images <- map["images"]
    }
}
