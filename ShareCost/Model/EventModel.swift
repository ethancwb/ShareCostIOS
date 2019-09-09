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
    var summary: String
    var title: String
    
    init(summary: String, title: String, id: String) {
        self.identifier = id
        self.summary = summary
        self.title = title
    }
    
    var category: String?
    var profileImage: String?
    var host: User?
}
