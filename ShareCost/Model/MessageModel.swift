//
//  MessageModel.swift
//  ShareCost
//
//  Created by Wenbin Chen on 7/20/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import Foundation
import MessageKit

class Message : MessageType {
    
    var author: User
    var messageId: String
    var content: String
    var timeStamp: Date
    
    // Message Type protocol
    var sender: SenderType {
        return Sender(id: author.identifier, displayName: author.firstName ?? "null")
    }
    var sentDate: Date {
        return timeStamp
    }
    var kind: MessageKind {
        return .text(content)
    }
    
    init(author: User, id: String, content: String) {
        self.author = author
        self.messageId = id
        self.content = content
        self.timeStamp = Date()
    }
    
}
