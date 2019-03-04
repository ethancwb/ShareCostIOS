//
//  NetworkService.swift
//  ShareCost
//
//  Created by Wenbin Chen on 2/23/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

func getLoginFromString(completionBlock: @escaping (String?) -> Void) {
    Alamofire.request("https://share-cost.herokuapp.com/test/get").responseJSON { response in
        if let JSON = response.result.value {
            print("JSON: \(JSON)")
            if let resultDict = JSON as? NSDictionary {
                if let resultString = resultDict["test"] as? String {
                    completionBlock(resultString)
                }
            }
        }
    }
}

func sendLoginInfo(username: String?, password: String?, completionBlock: @escaping (String?) -> Void) {
    Alamofire.request("https://share-cost.herokuapp.com/user/login", method: .post,
                      parameters: ["username": username,
                                   "password": password],
                      encoding: JSONEncoding.default, headers: nil).responseJSON { response in
        if let JSON = response.result.value {
            print("JSON: \(JSON)")
            if let resultDict = JSON as? NSDictionary {
                if let resultString = resultDict["test"] as? String {
                    completionBlock(resultString)
                }
            }
        }
    }
}
