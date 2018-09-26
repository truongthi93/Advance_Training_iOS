//
//  Parameter.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/26/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class Parameter: NSObject, Mappable {

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
    
    override init() {
    }
    
    init(text: String, fontStyle: String, fontSize: String, fontName: String, fontColor: String, backgroundColor: String, icon: String, timeStamp: String, timeStampFontColor: String, timeStampFontName: String, timeStampFontSize: String, timeStampFontStyle: String, title: String, titleFontColor: String, titleFontName: String, titleFontSize: String, titleFontStyle: String) {
        self.text = text
        self.fontStyle = fontStyle
        self.fontSize = fontSize
        self.fontName = fontName
        self.fontColor = fontColor
        self.backgroundColor = backgroundColor
        self.icon = icon
        self.timeStamp = timeStamp
        self.timeStampFontColor = timeStampFontColor
        self.timeStampFontName = timeStampFontName
        self.timeStampFontSize = timeStampFontSize
        self.timeStampFontStyle = timeStampFontStyle
        self.title = title
        self.titleFontColor = titleFontColor
        self.titleFontName = titleFontName
        self.titleFontSize = titleFontSize
        self.titleFontStyle = titleFontStyle
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        //String
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
}
