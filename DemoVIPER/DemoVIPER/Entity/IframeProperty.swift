//
//  Images.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class IframeProperty: Object, Mappable{
    
    var images: String? = ""
    var templateLines: [TemplateLinesItem]? = []
    
    func mapping(map: Map) {
        images <- map["images"]
        templateLines <- map["templateLines"]
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
}
