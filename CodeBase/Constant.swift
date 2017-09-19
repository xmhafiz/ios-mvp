//
//  Constant.swift
//  CodeBase
//
//  Created by Hafiz on 18/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import Foundation

struct APIConstant {
    static let production = "https://api.github.com"
    static let staging = ""
    static let baseURL = production
}

struct ErrorMessage {
    static let unknownAPIError = "Service is currently unavailable."
    static let unavailableData = "Data is currently unavailable"
    static let unauthenticatedError = "Your session has expired. Please re-login."
}
