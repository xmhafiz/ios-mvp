//
//  Repo.swift
//  CodeBase
//
//  Created by Hafiz on 18/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import ObjectMapper
// https://developer.github.com/v3/repos/#list-all-public-repositories

struct Repo: Mappable {
    
    var id: Int?
    var owner: User?
    var title: String?
    var description: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        owner <- map["owner"]
        title <- map["full_name"]
        description  <- map["description"]
    }
}

/* json model
 {
 "id": 1296269,
 "owner": {
     "login": "octocat",
     "id": 1,
     "avatar_url": "https://github.com/images/error/octocat_happy.gif",
     "gravatar_id": "",
     "url": "https://api.github.com/users/octocat",
     "html_url": "https://github.com/octocat",
     "followers_url": "https://api.github.com/users/octocat/followers",
     "following_url": "https://api.github.com/users/octocat/following{/other_user}",
     "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
     "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
     "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
     "organizations_url": "https://api.github.com/users/octocat/orgs",
     "repos_url": "https://api.github.com/users/octocat/repos",
     "events_url": "https://api.github.com/users/octocat/events{/privacy}",
     "received_events_url": "https://api.github.com/users/octocat/received_events",
     "type": "User",
     "site_admin": false
 },
 "name": "Hello-World",
 "full_name": "octocat/Hello-World",
 "description": "This your first repo!",
 "private": false,
 "fork": false,
 "url": "https://api.github.com/repos/octocat/Hello-World",
 "html_url": "https://github.com/octocat/Hello-World"
 }
 
 */
