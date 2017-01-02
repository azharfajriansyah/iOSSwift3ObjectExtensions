//
//  NSObjectExtension.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 9/27/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import Foundation

extension NSObject {
    
    class func archive(data: AnyObject, _ pathToArchive: URL) {
        if NSKeyedArchiver.archiveRootObject(data, toFile: pathToArchive.path) {
            Logger.log("\(pathToArchive.lastPathComponent): successsfully saved.")
        } else {
            Logger.log("\(pathToArchive.lastPathComponent): saving failed.")
        }
    }
    
    class func unarchive(pathToArchive: URL, awareExpiration: Bool = false, expirationTime: Double? = 3600) -> AnyObject? {
        
        if let data = NSKeyedUnarchiver.unarchiveObject(withFile: pathToArchive.path) {
            let fm = FileManager.default
            let attrs = try! fm.attributesOfItem(atPath: pathToArchive.path)
            
            if let dateModified = attrs[FileAttributeKey.modificationDate] {
                Logger.log("Age of file \(pathToArchive.lastPathComponent) in seconds: \(NSDate().timeIntervalSince((dateModified as! NSDate) as Date))")
                if awareExpiration && NSDate().timeIntervalSince((dateModified as! NSDate) as Date) > expirationTime! {
                    return nil
                } else {
                    return data as AnyObject?
                }
            }
            
            return nil
        }
        
        return nil
    }
    
    class func remove(pathToArchive: URL) {
        let fileManager = FileManager()
        do {
            try fileManager.removeItem(atPath: pathToArchive.path)
            Logger.log("\(pathToArchive.lastPathComponent) successfully removed")
        } catch {
            Logger.log("\(pathToArchive.lastPathComponent) failed to remove")
        }
    }
}
