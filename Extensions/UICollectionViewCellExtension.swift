//
//  UICollectionViewCellExtension.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 11/21/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import Foundation

extension UICollectionViewCell {
    class func getIdentifier() -> String {
        return String.className(self)
    }
}
