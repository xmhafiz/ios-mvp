//
//  RepositoryServices.swift
//  CodeBase
//
//  Created by Hafiz on 18/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import RxSwift
import ObjectMapper

class ReposityService {
    
    static let bag = DisposeBag()
    
    static func getData(callback:@escaping (Bool, [Repo]?, String?) -> Void) {
        moyaProvider.rx
            .request(GithubAPIService.getRepositories)
            .subscribe { event in
                
                switch event {
                case let .success(response):
                    
                    if response.success {
                        // on success, map to object
                        let data = Mapper<Repo>().mapArray(JSONObject: response.json)
                        callback(true, data, nil) // callback(success, data, errorMessage)
                        
                    }
                    else {
                        // non 200 status, map to error object
                        let errorResponse = Mapper<APIError>().map(JSONObject: response.json)
                        callback(false, nil, errorResponse?.message)
                    }
                    
                case let .error(error):
                    log.error(error)
                    callback(false, nil, ErrorMessage.unknownAPIError)
                }
            }
            .disposed(by: bag)
    }
}
