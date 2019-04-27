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

func sendLoginInfo(username: String, password: String, completionBlock: @escaping (String?) -> Void) {
    
    Alamofire.request("\(API_ROUTE)/user/userlogin", method: .post,
                      parameters: ["username": username,
                                   "password": password],
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
        if let data = response.result.value {
            completionBlock("123")
        }
    }
}

func registerNewUser(username: String, password: String, completionBlock: @escaping (String?) -> Void) {
    Alamofire.request("\(API_ROUTE)/user/usercreate", method: .post,
                      parameters: ["username": username,
                                   "password": password],
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
        switch response.result {
        case .success:
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                if let resultDict = JSON as? NSDictionary {
                    if let resultString = resultDict["test"] as? String {
                        completionBlock(resultString)
                    }
                }
            }
        case .failure(let error):
            print(error)
        }
    }
}
