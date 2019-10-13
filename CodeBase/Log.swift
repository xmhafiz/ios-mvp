//
//  Log.swift
//  CodeBase
//
//  Created by Hafiz on 01/10/2019.
//  Copyright © 2019. All rights reserved.
//

import Foundation

struct Log {
    enum LogType {
        case debug
        case success
        case error
        case warning
        case info
    }
    
    static func put(_ message: Any, type: LogType = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        var output = "\(Date()) "
        switch type {
        case .debug:
            output += "💙 "
        case .success:
            output += "💚 "
        case .error:
            output += "❤️ "
        case .warning:
            output += "💛 "
        case .info:
            output += "💜 "
        }
        let filename = file.components(separatedBy: "/").last ?? ""
        output += "\(filename):\(function):\(line) \(message)"
        print(output)
    }
}
