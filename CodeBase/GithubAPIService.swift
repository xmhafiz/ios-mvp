//
//  GithubAPIService.swift
//  CodeBase
//
//  Created by Hafiz on 27/01/2017.
//  Copyright © 2017 Hafiz. All rights reserved.
//

import Foundation
import Moya

// define all endpoints
// https://github.com/Moya/Moya/blob/master/docs/Examples/Basic.md

let moyaProvider = MoyaProvider<GithubAPIService>()


// API documentation 
// https://developer.github.com/v3/users/

enum GithubAPIService {
    case auth(username: String, password: String)
    case getUsers
    case getUser(username: String)
    case search(keyword: String, sortBy: String?, orderBy: String?)
    case getRepositories
}


extension GithubAPIService: TargetType {
    var task: Task {
        
        if let requestParameters = parameters {
            return .requestParameters(parameters: requestParameters, encoding: parameterEncoding)
        }
        
        return .requestPlain
        
    }
    
    var headers: [String : String]? {
        switch self {
        case .auth:
            return [
                "Accept" : "application/json"
            ]
        default:
            // add headers with bearer to endpoints above
            return [
                "Accept" : "application/json",
                "Content-Type" : "application/json"
            ]
        }
    }
    
    
    // set the base url and paths for each endpoints
    var baseURL : URL { return URL(string: APIConstant.baseURL)! }
    var path: String {
        switch self {
        case .auth:
            return "/authenticate"
        case .getUsers:
            return "/users"
        case .getUser(let username):
            return "/users/\(username)"
        case .search:
            // https://developer.github.com/v3/search/#search-users
            return "/search/users"
        case .getRepositories:
            return "/repositories"
        }
    }
    
    // define the method use
    var method: Moya.Method {
        switch self {
        case .auth:
            return .post
        default:
            return .get
        }
    }
    
    // parameters if needed
    var parameters: [String: Any]? {
        switch self {
        case .auth(let username, let password):
            
            return [
                "username": username,
                "password" : password
            ]
            
        case .search(let keyword, let sortBy, let orderBy):
            return [
                "q": keyword,
                "sort" : sortBy ?? "", // followers, repositories, or joined. Default: best match
                "order" : orderBy ?? "" // asc or desc
            ]
        default:
            return nil
        }
    }
    
    // encoding parameter in json or default
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .auth:
            // use JSON format for POST method
            return JSONEncoding.default
        default:
            // default
            return URLEncoding.default
        }
    }
    
    var sampleData: Data {
        
        return "{}".data(using: String.Encoding.utf8)!
    }
}

// this function will be used in below closure
public func url(route: TargetType) -> String {
    let url = route.baseURL.appendingPathComponent(route.path).absoluteString
    
    Log.put(url)
    return url
}
