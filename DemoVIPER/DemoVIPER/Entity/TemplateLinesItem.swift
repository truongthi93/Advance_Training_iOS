//
//  TemplateLinesItem.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class TemplateLinesItem: Object, Mappable{
    var columns: [ColumnsItem]? = []
    var lineType: String? = ""
    
    func mapping(map: Map) {
        columns <- map["columns"]
        lineType <- map["lineType"]
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
}
