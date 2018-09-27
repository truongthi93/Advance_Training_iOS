//
//  ColumnsItem.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class ColumnsItem: Mappable {
    var alignment: String? = ""
    var contentType: String? = ""
    var height: Int? = 0
    var percentWidth: Int? = 0
    var verticalAlignment: String? = ""
    var parameter: Parameter?

    init(alignment: String, contentType: String, height: Int,percentWidth: Int, verticalAlignment: String, parameter: Parameter) {
        self.alignment = alignment
        self.contentType = contentType
        self.height = height
        self.percentWidth = percentWidth
        self.verticalAlignment = verticalAlignment
        self.parameter = parameter
    }
    
    required init?(map: Map) {
        parameter <- map["parameter"]
        alignment <- map["alignment"]
        contentType <- map["contentType"]
        height <- map["height"]
        percentWidth <- map["percentWidth"]
        verticalAlignment <- map["verticalAlignment"]
    }
    
    func mapping(map: Map) {
        parameter <- map["parameter"]
        alignment <- map["alignment"]
        contentType <- map["contentType"]
        height <- map["height"]
        percentWidth <- map["percentWidth"]
        verticalAlignment <- map["verticalAlignment"]
    }
}
