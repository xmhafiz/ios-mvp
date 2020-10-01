//
//  DefaultsKey.swift
//  CodeBase
//
//  Created by Hafiz on 18/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import SwiftyUserDefaults

extension DefaultsKeys {
    static let authToken = DefaultsKey<String?>.init("authToken")
    static let username = DefaultsKey<String>.init("username", defaultValue: "")
}
