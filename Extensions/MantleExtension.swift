//
//  Mantle.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 12/21/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import Mantle

extension MTLJSONSerializing {
    func getJSONRepresentation() -> [String : AnyObject]? {
        do {
            return try MTLJSONAdapter.jsonDictionary(fromModel: self) as? [String : AnyObject]
        } catch {
            return nil
        }
    }
}
