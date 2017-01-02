//
//  S3Client.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 11/17/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import AWSS3

public class S3Client: NSObject {
    var transferUtility: AWSS3TransferUtility?
    static var sharedInstance: S3Client {
        struct Static {
            static let instance = S3Client()
        }
        
        return Static.instance
    }
    
    func initiateClient() {
        let credential = AWSStaticCredentialsProvider(accessKey: "AKIAIA6Y6SNBHBIONMIQ", secretKey: "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")
        let defaultServiceConfiguration = AWSServiceConfiguration(region: AWSRegionType.apSoutheast1, credentialsProvider: credential)
        AWSServiceManager.default().defaultServiceConfiguration = defaultServiceConfiguration
        
        AWSLogger.default().logLevel = .verbose
        
        transferUtility = AWSS3TransferUtility.default()
    }
    
}
