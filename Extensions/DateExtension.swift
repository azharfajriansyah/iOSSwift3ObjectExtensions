//
//  NSDateExtension.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 12/22/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var defaultDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "id_ID") as Locale!
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        return dateFormatter
    }
    
    static var fullDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter.defaultDateFormatter
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return dateFormatter
    }
    
    static func getFormatter(withFormat: String) -> DateFormatter {
        let dateFormatter = DateFormatter.defaultDateFormatter
        dateFormatter.dateFormat = withFormat
        return dateFormatter
    }
}
