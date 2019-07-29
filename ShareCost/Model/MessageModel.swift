//
//  MessageModel.swift
//  ShareCost
//
//  Created by Wenbin Chen on 7/20/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import Foundation
import MessageKit
import FirebaseFirestore

class Message : MessageType {
    
    var author: User
    var messageId: String
    var content: String
    var timeStamp: Date
    var postId: String
    
    // Message Type protocol
    var sender: SenderType {
        return Sender(id: author.identifier, displayName: author.username)
    }
    var sentDate: Date {
        return timeStamp
    }
    var kind: MessageKind {
        return .text(content)
    }
    
    init(author: User, id: String, content: String, postId: String) {
        self.author = author
        self.messageId = id
        self.content = content
        self.timeStamp = Date()
        self.postId = postId
    }
    
    func jsonFormat() -> [String : Any] {
        return ["message_id" : messageId,
                "message_author_id" : author.identifier,
                "message_created_at" : timeStamp,
                "message_content": content,
                "message_author_name": author.username,
                "message_post_id": postId]
    }
    
    static func newFromDocument(doc: QueryDocumentSnapshot) -> Message? {
        let data = doc.data()
        let m = Message.init(author: userSession.shared.getCurrentUser()!, id: data["message_id"] as! String, content: data["message_content"] as! String, postId: data["message_post_id"] as? String ?? "")
        return m
    }
    
}

extension Message: Equatable, Comparable {
    static func < (lhs: Message, rhs: Message) -> Bool {
        return lhs.sentDate.compare(rhs.sentDate).rawValue == 1 ? false : true
    }
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.messageId == rhs.messageId
    }
}


