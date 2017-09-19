//
//  UIFont.swift
//  CodeBase
//
//  Created by Hafiz on 18/09/2017.
//  Copyright © 2017 github. All rights reserved.
//

import UIKit

extension UIFont {
    static func regular(size: CGFloat) -> UIFont {
        let font = UIFont(name: "AvenirNext-Regular", size: size)
        return font!
    }
    
    static func bold(size: CGFloat) -> UIFont {
        let font = UIFont(name: "AvenirNext-Bold", size: size)
        return font!
    }
    
    static func medium(size: CGFloat) -> UIFont {
        let font = UIFont(name: "AvenirNext-Medium", size: size)
        return font!
    }
}
