//
//  userModel.swift
//  ShareCost
//
//  Created by Wenbin Chen on 4/20/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import Foundation

class User : NSObject {
    
    // Required fields
    var username: String
    var identifier: String
    // Optional fields
    @objc var password: String?
    @objc var firstName: String?
    @objc var lastName: String?
    @objc var avatarImage: String?
    @objc var email: String?
    @objc var phoneNumber: String?
    var showname: Bool?
    var showemail: Bool?
    var showphonenumber: Bool?
    @objc var acceptedListConnection: [User] = []
    @objc var pendingListConnection: [User] = []
    
    @objc public var displayName: String {
        if let fname = self.firstName,
            let lname = self.lastName {
            return "\(fname) \(lname)"
        } else {
            return ""
        }
    }

    init(username: String, identifier: String) {
        self.username = username
        self.identifier = identifier
    }
    
    public func propertyNames() -> [String] {
        return ["firstName", "lastName", "password", "listConnection", "email"]
    }
    
//
//    public func setFirstName(firstName: String) {
//        self.firstName = firstName
//    }
//    
//    public func setLastName(lastName: String) {
//        self.lastName = lastName
//    }
//    
//    public func setAvatarImage(avatarImage: String) {
//        self.avatarImage = avatarImage
//    }
//    
//    public func setEmail(email: String) {
//        self.email = email
//    }
//    
//    public func setPhoneNumber(phoneNumber: String) {
//        self.phoneNumber = phoneNumber
//    }
//    
//    public func setShowname(showname: Bool) {
//        self.showname = showname
//    }
//    
//    public func setShowemail(showemail: Bool) {
//        self.showemail = showemail
//    }
//    
//    public func setShowphonenumber(showphonenumber: Bool) {
//        self.showphonenumber = showphonenumber
//    }
}
