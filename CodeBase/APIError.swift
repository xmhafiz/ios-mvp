//
//  APIError.swift
//  CodeBase
//
//  Created by Hafiz on 18/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import ObjectMapper

struct APIError: Mappable {
    
    var message: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        message <- map["message"]
    }
}
