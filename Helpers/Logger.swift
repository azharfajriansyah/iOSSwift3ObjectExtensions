//
//  Logger.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 9/23/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import Crashlytics

public class Logger {
    let debugMode = true
    
    class var shared: Logger {
        struct Static {
            static let instance: Logger = Logger()
        }
        return Static.instance
    }
    
    func d(_ obj: AnyObject) {
        if (debugMode) { debugPrint(obj) }
        
        let o = obj as! NSObject
        CLSLogv("%@", getVaList([o]))
    }
}

extension Logger {
    class func log(_ obj: Any) {
        Logger.shared.d(obj as AnyObject)
    }
}
