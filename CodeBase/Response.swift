//
//  Response.swift
//  CodeBase
//
//  Created by Hafiz on 18/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import Moya

extension Response {
    var json: Any? {
        do {
            let json = try JSONSerialization.jsonObject(with: self.data, options: [])
            
            return json
        }
        catch let error as NSError {
            log.error(error)
        }
        
        return nil
    }
    
    var success: Bool {
        return self.statusCode == 200
    }
    
    var unauthenticated: Bool {
        return self.statusCode == 401
    }
}
