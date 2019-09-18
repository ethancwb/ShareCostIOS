//
//  userSession.swift
//  ShareCost
//
//  Created by Wenbin Chen on 4/27/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import Foundation
import UIKit

class userSession {
    
    static let shared = userSession()
    
    var currentUser : User?
    var allEventCategories : [eventCategory] = []
    public var isLocalServer : Bool = true
    
    @objc var acceptedListConnection: [User] {
        return currentUser?.acceptedListConnection ?? []
    }
    @objc var pendingListConnection: [User] {
        return currentUser?.pendingListConnection ?? []
    }
    // restricted init method to ensure singleton pattern
    private init() {

    }
    
    func setCurrentUser(user: User) {
        self.currentUser = user
    }
    
    func getCurrentUser() -> User? {
        return self.currentUser
    }
    
    func setupEventCategories() {
        var cats : [eventCategory] = []
//        for cat in eventCategories.allCases {
//            cats.append(eventCategory.init(name: cat.rawValue, image: UIImage(named: "")))
//        }
    }

}

public enum eventCategories : String, CaseIterable {
    case hiking = "Hiking"
    case dinner = "Dinner"
    case sport = "Sport"
    case gathering = "Gathering"
    case party = "Party"
    case fieldTrip = "FieldTrip"
    case others = "Others"
}
