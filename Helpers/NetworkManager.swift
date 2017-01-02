//
//  NetworkManager.swift
//  iOSSwift3ObjectExtensions
//
//  Created by Azhar Fajriansyah on 9/22/16.
//  Copyright © 2016 Azhar Fajriansyah. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {
    
    class func request(_ method: HTTPMethod, _ URLString: URLConvertible, parameters: [String: AnyObject]? = nil, encoding: ParameterEncoding = URLEncoding.default, useBasicToken: Bool? = false, logoutIf401: Bool = true, completion: @escaping (DataResponse<Any>) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        var headers = [String : String]()
        if useBasicToken! {
            headers["Authorization"] = "\(Configuration.Authorization())"
        } else {
            headers["Authorization"] = (Session.sharedInstance.token != nil)
                ? "\(Session.sharedInstance.token!.tokenType!) \(Session.sharedInstance.token!.accessToken!)"
                : "\(Configuration.Authorization())"
        }
        Logger.log(headers)
        
        let req = manager.request(URLString, method: method, parameters: parameters, encoding: encoding, headers: headers)
        req.responseString { (response) in
            if let response = response.response {
                Logger.log(response)
                if response.statusCode == 401 && logoutIf401 && Session.sharedInstance.user != nil
                {
                    NotificationCenter.default.post(name: NSNotification.Name(HoldrNotification.tokenExpired), object: nil)
                    
                    User.signOut()
                    return
                    
                } else {
                    req.responseJSON { (response) -> Void in
                        completion(response)
                    }
                }
            } else {
                req.responseJSON { (response) -> Void in
                    completion(response)
                }
            }
        }
    }
}
