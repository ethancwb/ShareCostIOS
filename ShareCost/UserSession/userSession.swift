//
//  userSession.swift
//  ShareCost
//
//  Created by Wenbin Chen on 4/27/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import Foundation

class userSession {
    
    static let shared = userSession()
    
    var currentUser : User?
    // restricted init method to ensure singleton pattern
    private init() {}
    
    func setCurrentUser(user: User) {
        self.currentUser = user
    }
    
    func getCurrentUser() -> User? {
        return self.currentUser
    }
}
