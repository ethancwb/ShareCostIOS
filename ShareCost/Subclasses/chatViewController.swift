//
//  ChatViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 7/20/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit
import MessageKit
import Firebase
import InputBarAccessoryView
import FirebaseFirestore

class ChatViewController: MessagesViewController, MessagesDataSource {
    
    public var messages : [Message] = []
    public var messageListener: ListenerRegistration?
    var currentUser = userSession.shared.getCurrentUser()
    var currentPostId: String? = nil
    
    private let db = Firestore.firestore()
    private var reference: CollectionReference?
    
    deinit {
        messageListener?.remove()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messageInputBar.delegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        reference = db.collection(["events", currentPostId ?? "", "chatroom"].joined(separator: "/"))
        messageListener = reference?.addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error listening for channel updates: \(error?.localizedDescription ?? "No error")")
                return
            }
            
            snapshot.documentChanges.forEach { change in
                self.handleDocumentChange(change)
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if self.isFirstResponder != true {
            self.becomeFirstResponder()
        }
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func currentSender() -> SenderType {
        return Sender(id: currentUser?.identifier ?? "", displayName: currentUser?.username ?? "")
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func messageTopLabelHeight(
        for message: MessageType,
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 12
    }
    
    func messageTopLabelAttributedText(
        for message: MessageType,
        at indexPath: IndexPath) -> NSAttributedString? {
        
        return NSAttributedString(
            string: message.sender.displayName,
            attributes: [.font: UIFont.systemFont(ofSize: 12)])
    }
}

extension ChatViewController: MessagesLayoutDelegate {
    func heightForLocation(message: MessageType, at indexPath: IndexPath, with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
    func footerViewSize(for section: Int, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize(width: 0, height: 8)
    }
}

extension ChatViewController: MessagesDisplayDelegate {
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        let message = messages[indexPath.section]
        let image = UIImage(named: "avatar_icon_placeholder")
        avatarView.image = image
    }
}

extension ChatViewController: MessageInputBarDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let newMessage = Message.init(author: currentUser!, id: UUID().uuidString, content: text, postId: currentPostId ?? "")
//        messages.append(newMessage)
        save(newMessage)
        inputBar.inputTextView.text = ""
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)
    }
}

// Helpers
extension ChatViewController {
    func save(_ message: Message){
        reference?.addDocument(data: message.jsonFormat()) { error in
            if let e = error {
                print("Error sending message: \(e.localizedDescription)")
                return
            }
            self.messagesCollectionView.scrollToBottom()
        }
    }
    
    private func handleDocumentChange(_ change: DocumentChange) {
        guard let message = Message.newFromDocument(doc: change.document) else {
            return
        }
        change.type
        
        switch change.type {
        case .added:
            insertNewMessage(message)
            
        default:
            break
        }
    }
    
    private func insertNewMessage(_ message: Message) {
        guard !messages.contains(message) else {
            return
        }
        
        messages.append(message)
        messages.sort()
        
        let isLatestMessage = messages.index(of: message) == (messages.count - 1)
        let shouldScrollToBottom = isLatestMessage
        
        messagesCollectionView.reloadData()
        
        if shouldScrollToBottom {
            DispatchQueue.main.async {
                self.messagesCollectionView.scrollToBottom(animated: true)
            }
        }
    }
}
