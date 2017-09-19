//
//  String.swift
//  CodeBase
//
//  Created by Hafiz on 18/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import UIKit

extension String {
    public var url: URL? {
        return URL(string: self)
    }
}
