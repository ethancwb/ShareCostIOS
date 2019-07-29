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

let API_ROUTE = "http://localhost:8000/api"

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
                                    let id = userJson["id"] as? String {
                                    let user = User.init(username: username, identifier: id)
                                    for name in user.propertyNames() {
                                        if name == "listConnection" {
                                            if let objects = userJson["listConnection"] as? [[String : Any]] {
                                                for obj in objects {
                                                    if let status = obj["status"] as? String,
                                                        let u = obj["user"] as? [String : String] {
                                                        if status == "1" {
                                                            let new_user = User.init(username: u["username"]!, identifier: u["id"]!)
                                                            new_user.firstName = u["firstname"]
                                                            new_user.lastName = u["lastname"]
                                                            user.pendingListConnection.append(new_user)
                                                        } else if status == "2" {
                                                            let new_user = User.init(username: u["username"]!, identifier: u["id"]!)
                                                            new_user.firstName = u["firstname"]
                                                            new_user.lastName = u["lastname"]
                                                            user.acceptedListConnection.append(new_user)
                                                        }
                                                    }
                                                }
                                            }
                                        } else {
                                            if let val = userJson[name] {
                                                user.setValue(val, forKey: name)
                                            }
                                        }
                                    }
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
                        let id = userJson["id"] as? String {
                        let user = User.init(username: username, identifier: id)
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
    Alamofire.request("\(API_ROUTE)/friend/get", method: .get,
                      parameters: ["from": userId,
                                   "status": "2"],
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                        switch response.result {
                        case .success(let data):
                            if let userJson = response.result.value as? [[String : Any]] {
                                for user in userJson {
                                    let new_user = User.init(username: user["username"] as! String, identifier: user["id"] as! String)
                                    new_user.firstName = user["firstname"] as! String
                                    new_user.lastName = user["lastname"] as! String
                                    if (!(userSession.shared.currentUser?.acceptedListConnection.contains(new_user))!) {
                                        userSession.shared.currentUser?.acceptedListConnection.append(new_user)
                                    }
                                }
                                successBlock(userSession.shared.currentUser!.acceptedListConnection)
                            }
                        case .failure(let err):
                            print("get list failed")
                        }
    }
}

func addUser(userId: String, requestName: String, successBlock: @escaping () -> Void, errorBlock: @escaping () -> Void) {
    Alamofire.request("\(API_ROUTE)/friend/request", method: .post,
                      parameters: ["from": userId,
                                   "to": requestName],
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                        if let statusCode = response.response?.statusCode {
                            if statusCode <= 300 {
                                successBlock()
                            } else {
                                errorBlock()
                            }
                        }
    }
}

func getPendingRequests(userId: String, successBlock: @escaping () -> Void, errorBlock: @escaping () -> Void) {
    Alamofire.request("\(API_ROUTE)/connection/get", method: .get,
                      parameters: ["identifier": userId],
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                        if let statusCode = response.response?.statusCode {
                            if statusCode <= 300 {
                                successBlock()
                            } else {
                                errorBlock()
                            }
                        }
    }
}
