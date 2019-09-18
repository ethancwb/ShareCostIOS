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

let API_ROUTE = "https://sharecostnew.herokuapp.com/api"

func sendPostRequest(params: [String : String]) {
    
}

func getItem(path: String, successBlock: @escaping (Any?) -> Void, errBlock: @escaping () -> Void = {}, fullServerPath: String? = nil) {
    let requestPath = fullServerPath != nil ? fullServerPath : fullPath(path: path)
    Alamofire.request(requestPath!, method: .get,
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                        switch response.result {
                        case .success(_):
                            successBlock(response.result.value)
                        case .failure(let err):
                            print("get list failed \(err)")
                            errBlock()
                        }
    }
}

func fullPath(path: String) -> String {
    let userId = userSession.shared.getCurrentUser()?.identifier ?? ""
    return "\(API_ROUTE)/\(path)/\(userId)"
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

func getUserFriendList(path: String, successBlock: @escaping () -> Void) {
    let parseBlock : (Any) -> Void = { result in
        if let userJson = result as? [[String : Any]] {
            for user in userJson {
                let new_user = User.init(username: user["username"] as! String, identifier: user["id"] as! String)
                new_user.firstName = user["firstname"] as? String
                new_user.lastName = user["lastname"] as? String
                if path.contains("pending") {
                    if (!(userSession.shared.currentUser?.pendingListConnection.map{$0.identifier}.contains(new_user.identifier))!) {
                        userSession.shared.currentUser?.pendingListConnection.append(new_user)
                    }
                }
                if path.contains("getfriend") {
                    if (!(userSession.shared.currentUser?.acceptedListConnection.map{$0.identifier}.contains(new_user.identifier))!) {
                        userSession.shared.currentUser?.acceptedListConnection.append(new_user)
                    }
                }
            }
            successBlock()
        }
    }
    getItem(path: path, successBlock: parseBlock)
}

func addUser(userId: String, requestName: String, successBlock: @escaping (Any?) -> Void, errorBlock: @escaping () -> Void) {
    if let userId = userSession.shared.currentUser?.identifier {
        let name = requestName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let path = "\(API_ROUTE)/friend/request/\(userId)/\(name)"
        getItem(path: "", successBlock: successBlock, errBlock: errorBlock, fullServerPath: path)
    }
}

func getAllEvents(userId: String, successBlock: @escaping ([[String : Any]]) -> Void, errorBlock: @escaping () -> Void) {
    Alamofire.request("\(API_ROUTE)/event/allEvents", method: .post,
                      parameters: ["user_id": userId],
                      encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                        if let statusCode = response.response?.statusCode {
                            if statusCode <= 300,
                                let res = response.result.value as? [[String : Any]] {
                                successBlock(res)
                            } else {
                                errorBlock()
                            }
                        }
    }
}
