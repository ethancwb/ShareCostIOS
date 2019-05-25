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

let API_ROUTE = "http://localhost:8080/api"

func sendPostRequest(params: [String : String]) {
    
}

func getLoginFromString(completionBlock: @escaping (String?) -> Void) {
    Alamofire.request("\(API_ROUTE)/test/get").responseJSON { response in
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

func sendLoginInfo(username: String, password: String, completionBlock: @escaping (User?) -> Void) {
    Alamofire.request("\(API_ROUTE)/user/userlogin", method: .post,
                      parameters: ["username": username,
                                   "password": password],
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
        if let userJson = response.result.value as? [String : Any] {
            if let username = userJson["username"] as? String,
                let password = userJson["password"] as? String,
                let id = userJson["id"] as? String {
                let user = User.init(username: username, password: password, identifier: id)
                completionBlock(user)
            }
        }
    }
}

func registerNewUser(username: String, password: String, completionBlock: @escaping (User?) -> Void) {
    Alamofire.request("\(API_ROUTE)/user/usercreate", method: .post,
                      parameters: ["username": username,
                                   "password": password],
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
        if let statusCode = response.response?.statusCode {
            if statusCode <= 300 {
                if let userJson = response.result.value as? [String : Any] {
                    if let username = userJson["username"] as? String,
                        let password = userJson["password"] as? String,
                        let id = userJson["id"] as? String {
                        let user = User.init(username: username, password: password, identifier: id)
                        completionBlock(user)
                    }
                }
            } else {
                print("fail to login")
            }
        }
    }
}
