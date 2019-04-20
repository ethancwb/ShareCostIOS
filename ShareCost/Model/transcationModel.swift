//
//  transcationModel.swift
//  ShareCost
//
//  Created by Wenbin Chen on 4/20/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import Foundation

class Transcation {
    
    var fromUser : User
    var toUser : User
    var transcationValue : String
    var title : String
    var detail : String?
    
    init(from: User, to: User, value: String, title: String) {
        self.fromUser = from
        self.toUser = to
        self.transcationValue = value
        self.title = title
    }
    
    public func setDetail(detail: String) {
        self.detail = detail
    }
}
