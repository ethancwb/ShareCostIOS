//
//  userModel.swift
//  ShareCost
//
//  Created by Wenbin Chen on 4/20/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import Foundation

class User {
    
    // Required fields
    var username: String
    var password: String
    var identifier: String
    // Optional fields
    var firstName: String?
    var lastName: String?
    var avatarImage: String?
    var email: String?
    var phoneNumber: String?
    var showname: Bool?
    var showemail: Bool?
    var showphonenumber: Bool?

    init(username: String, password: String, identifier: String) {
        self.username = username
        self.password = password
        self.identifier = identifier
    }
    
    public func setFirstName(firstName: String) {
        self.firstName = firstName
    }
    
    public func setLastName(lastName: String) {
        self.lastName = lastName
    }
    
    public func setAvatarImage(avatarImage: String) {
        self.avatarImage = avatarImage
    }
    
    public func setEmail(email: String) {
        self.email = email
    }
    
    public func setPhoneNumber(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    public func setShowname(showname: Bool) {
        self.showname = showname
    }
    
    public func setShowemail(showemail: Bool) {
        self.showemail = showemail
    }
    
    public func setShowphonenumber(showphonenumber: Bool) {
        self.showphonenumber = showphonenumber
    }
}
