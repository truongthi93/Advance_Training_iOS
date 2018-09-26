//
//  ColumnsItem.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class ColumnsItem: Object, Mappable {
    var alignment: String? = ""
    var contentType: String? = ""
    var height: Int? = 0
    var percentWidth: Int? = 0
    var verticalAlignment: String? = ""
    var parameter = List<Parameter>()
    
    func mapping(map: Map) {
        parameter <- map["parameter"]
        alignment <- map["alignment"]
        contentType <- map["contentType"]
        height <- map["height"]
        percentWidth <- map["percentWidth"]
        verticalAlignment <- map["verticalAlignment"]
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
}
