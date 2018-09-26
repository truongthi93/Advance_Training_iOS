//
//  Parameter.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Parameter: Object, Mappable {

    var text: String? = ""
    var fontStyle: String? = ""
    var fontSize: String? = ""
    var fontName: String? = ""
    var fontColor: String? = ""
    
    var backgroundColor: String? = ""
    var icon: String? = ""
    var timeStamp: String? = ""
    var timeStampFontColor: String? = ""
    var timeStampFontName: String? = ""
    var timeStampFontSize: String? = ""
    var timeStampFontStyle: String? = ""
    var title: String? = ""
    var titleFontColor: String? = ""
    var titleFontName: String? = ""
    var titleFontSize: String? = ""
    var titleFontStyle: String? = ""
    
    func mapping(map: Map) {
        text <- map["text"]
        fontStyle <- map["fontStyle"]
        fontSize <- map["fontSize"]
        fontName <- map["fontName"]
        fontColor <- map["fontColor"]
        backgroundColor <- map["backgroundColor"]
        icon <- map["icon"]
        timeStamp <- map["timeStamp"]
        timeStampFontColor <- map["timeStampFontColor"]
        timeStampFontName <- map["timeStampFontName"]
        timeStampFontSize <- map["timeStampFontSize"]
        timeStampFontStyle  <- map["timeStampFontStyle"]
        title <- map["title"]
        titleFontColor <- map["titleFontColor"]
        titleFontName <- map["titleFontName"]
        titleFontSize <- map["titleFontSize"]
        titleFontStyle <- map["titleFontStyle"]
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
}
