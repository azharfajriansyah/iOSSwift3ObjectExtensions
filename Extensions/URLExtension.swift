//
//  NSURLExtension.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 9/27/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import Foundation

extension URL {
    static func documentsDirectory() -> URL {
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as String!
        
        let url: URL = URL(string: documentsDirectory!)!
        
        return url
    }
    
    static func dataDirectory() -> URL {
        let defaultManager = FileManager.default
        let url = self.documentsDirectory().appendingPathComponent("Data")
        let path = url.path
        
        if !defaultManager.fileExists(atPath: path) {
            do {
                try defaultManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                Logger.log("\(url.lastPathComponent) directory has been created.")
            } catch {
                Logger.log("Unable to create \(url.lastPathComponent) directory. App will use documents directory instead")
            }
            
            return self.documentsDirectory()
        } else {
            Logger.log("\(url.lastPathComponent) directory already exists.")
            
            return url
        }
    }
}
