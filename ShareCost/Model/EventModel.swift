//
//  EventModel.swift
//  ShareCost
//
//  Created by Wenbin Chen on 7/21/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import Foundation
import UIKit

class Event {
    
    let identifier: String
    var host: User
    var summary: String
    var title: String
    
    init(host: User, summary: String, title: String) {
        self.identifier = "abcer-qwet123-51234125"
        self.summary = summary
        self.title = title
        self.host = host
    }
    
    var category: String?
    var profileImage: String?
}
