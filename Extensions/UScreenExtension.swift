//
//  UScreenExtension.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 9/21/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import UIKit

enum DeviceType {
    case iPhone4
    case iPhone5
    case iPhone6
    case iPhone6P
}

extension UIScreen {
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static var screenSize: CGSize {
        return UIScreen.main.bounds.size
    }
    
    static var screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    class func deviceType() -> DeviceType {
        var deviceType: DeviceType
        
        switch self.screenHeight {
        case 568.0:
            deviceType = .iPhone5
        case 667.0:
            deviceType = .iPhone6
        case 736.0:
            deviceType = .iPhone6P
        default:
            deviceType = .iPhone4
        }
        
        return deviceType
    }
    
    class func noToolbarMargin() -> CGFloat {
        switch self.deviceType() {
        case .iPhone6P:
            return -20
        default:
            return -16
        }
    }
}
