//
//  FontHelper.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 9/22/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import UIKit

enum FontSize: CGFloat {
    case ENORMOUS = 45
    case XXXL = 26
    case XXL = 24
    case XL = 22
    case LLL = 20
    case LL = 18
    case L = 17
    case M = 16
    case S = 15
    case SS = 13
    case SSS = 11
    
    static func getPreferredFontSize(defaultSize: CGFloat) -> CGFloat {
        let defaultFontSize = defaultSize
        
        // IN CASE YOU NEED DIFFERENT FONT SIZE PER DEVICE, SET HERE 😉
        switch UIScreen.deviceType() {
        case .iPhone4:
            return defaultFontSize
        case .iPhone5:
            return defaultFontSize
        case .iPhone6P:
            return defaultFontSize
        default:
            return defaultFontSize
        }
    }
}

enum FontType: String {
    case regular = "Metric"
    case semibold = "MetricSemibold"
    case italic = "Metric-Italic"
    case semiboldItalic = "MetricSemiboldItalic-Italic"
}


extension UIFont {
    class func appFont(fontType: FontType, fontSize: FontSize) -> UIFont {
        return UIFont(name: fontType.rawValue, size: FontSize.getPreferredFontSize(defaultSize: fontSize.rawValue))!
    }
}
