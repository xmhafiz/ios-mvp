//
//  User.swift
//  CodeBase
//
//  Created by Hafiz on 18/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import ObjectMapper

struct User: Mappable {
    
    var id: Int?
    var avatarURL: String?
    var webURL: String?
    var username: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        avatarURL <- map["avatar_url"]
        webURL <- map["url"]
        username  <- map["login"]
    }
}
