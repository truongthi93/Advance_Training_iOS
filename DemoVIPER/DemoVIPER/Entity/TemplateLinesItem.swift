//
//  TemplateLinesItem.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class TemplateLinesItem: Mappable{
    var columns: [ColumnsItem]? = []
    var lineType: String? = ""
    
    init(columns: [ColumnsItem],lineType: String) {
        self.columns = columns
        self.lineType = lineType
    }
    
    required init?(map: Map) {
        //Optional
        columns <- (map["columns"], ArrayTransform())
        //String
        lineType <- map["lineType"]
    }
    
    func mapping(map: Map) {
        //Optional
        columns <- (map["columns"], ArrayTransform())
        //String
        lineType <- map["lineType"]
    }
}
