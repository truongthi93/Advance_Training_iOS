//  SplashbaseImage.swift
//  iOSTraning2018
//
//  Created by Bao Ngo Mau on 9/17/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class SplashbaseImage : NSObject,Mappable{
    var large_url : String? = Constants.stringNil
    var url : String? = Constants.stringNil
    
    override init() {
    }
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        large_url <- map[Constants.nameDataAPILarge_url]
        url <- map[Constants.nameDataAPIUrl]
    }
}
