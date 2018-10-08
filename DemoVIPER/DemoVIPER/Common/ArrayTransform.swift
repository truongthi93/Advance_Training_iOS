// Based on Swift 1.2, ObjectMapper 0.15, RealmSwift 0.94.1
// Author: Timo Wälisch <timo@waelisch.de>

import UIKit
import ObjectMapper

class ArrayTransform<T> : TransformType where T:Mappable {
    typealias Object = Array<T>
    typealias JSON = [AnyObject]
    
    let mapper = Mapper<T>()
    
    func transformFromJSON(_ value: Any?) -> Object? {
        var results = Array<T>()
        if let value = value as? [AnyObject] {
            for json in value {
                if let obj = mapper.map(JSONObject: json) {
                    results.append(obj)
                }
            }
        }
        return results
    }
    
    func transformToJSON(_ value: Object?) -> JSON? {
        var results = [AnyObject]()
        if let value = value {
            for obj in value {
                let json = mapper.toJSON(obj)
                results.append(json as AnyObject)
            }
        }
        return results
    }
}
