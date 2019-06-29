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

func sendLoginInfo(username: String, password: String, completionBlock: @escaping (User?) -> Void, errorBlock: @escaping () -> Void) {
    Alamofire.request("\(API_ROUTE)/user/userlogin", method: .post,
                      parameters: ["username": username,
                                   "password": password],
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                        switch response.result {
                        case .success(let data):
                            if let userJson = response.result.value as? [String : Any] {
                                if let username = userJson["username"] as? String,
                                    let password = userJson["password"] as? String,
                                    let id = userJson["id"] as? String {
                                    let user = User.init(username: username, password: password, identifier: id)
                                    completionBlock(user)
                                }
                            }
                        case .failure(let error):
                            errorBlock()
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

func getUserFriendList(userId: String, successBlock: @escaping ([User]) -> Void) {
    Alamofire.request("\(API_ROUTE)/friend/get", method: .post,
                      parameters: ["from": userId],
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                        switch response.result {
                        case .success(let data):
                            if let userJson = response.result.value as? [String : Any] {
                                let arr = userJson
                            }
                        case .failure(let err):
                            print("get list failed")
                        }
    }
}

func addUser(userId: String, requestName: String, successBlock: @escaping () -> Void) {
    Alamofire.request("\(API_ROUTE)/friend/request", method: .post,
                      parameters: ["from": userId,
                                   "to": requestName],
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                        if let statusCode = response.response?.statusCode {
                            if statusCode <= 300 {
                                successBlock()
                            }
                        }
    }
}
