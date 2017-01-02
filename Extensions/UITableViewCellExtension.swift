//
//  UITableViewCellExtension.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 11/18/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    class func getIdentifier() -> String {
        return String.className(self)
    }
}
