//
//  StringExtension.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 9/26/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    static func className(_ tClass: AnyClass!) -> String {
        return NSStringFromClass(tClass).components(separatedBy: ".").last!
    }
    
    func trimWhiteSpaces() -> String! {
        guard self.length() > 0 else { return "" }
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func length() -> Int! {
        guard self.characters.count > 0 else { return 0 }
        return self.characters.count
    }
    
    func isValidEmailAddress(_ strict: Bool) -> Bool {
        let stricterFilterString = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        let laxString = ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        let emailRegex = strict ? stricterFilterString : laxString
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: self)
    }
    
    var thousandSeparatorFormat: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = NSLocale(localeIdentifier: "id_ID") as Locale!
        numberFormatter.formatterBehavior = .behavior10_4
        numberFormatter.numberStyle = .decimal
        
        var string = self.replacingOccurrences(of: ".", with: "", options: String.CompareOptions.literal, range: nil) as NSString
        var value = string.doubleValue
        
        if string.length > 15 {
            string = string.substring(with: NSMakeRange(0, 15)) as NSString
            value = string.doubleValue
            
            return numberFormatter.string(from: NSNumber(value: value))!
        }
        
        return numberFormatter.string(from: NSNumber(value: value))!
    }
    
    var currencyFormat: String {
        return "Rp " + self.thousandSeparatorFormat
    }
    
    func paddingWith(padChar: String, pieceLen: Int) -> String {
        if self.length() > 0 {
            let piecesCount = self.length() / pieceLen
            let lastPieceLen = self.length() % pieceLen
            var pieces = [String]()
            var resultString = ""
            
            for i in 0..<piecesCount {
                let startIndex = self.index(self.startIndex, offsetBy: i * pieceLen)
                var endIndex: Index
                if (i < piecesCount - 1) {
                    endIndex = self.index(self.startIndex, offsetBy: (i + 1) * pieceLen)
                } else {
                    endIndex = self.index(self.startIndex, offsetBy: ((i + 1) * pieceLen) + lastPieceLen)
                }
                pieces.append(self.substring(with: startIndex..<endIndex))
            }
            
            for piece in pieces {
                resultString = resultString + piece
                if piece != pieces.last {
                    resultString = resultString + padChar
                }
            }
            return resultString
        }
        return ""
    }
    
    var capitalizeFirstLetter: String {
        if self.length() > 0 {
            return String(describing: characters.first!).uppercased() + String(characters.dropFirst())
        }
        return ""
    }
}
