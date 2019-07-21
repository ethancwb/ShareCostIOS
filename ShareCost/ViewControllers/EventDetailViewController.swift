//
//  EventDetailViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 7/13/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit
import Firebase
import MessageKit
import FirebaseFirestore

class EventDetailViewController: UIViewController {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var mainheader: UIView!
    @IBOutlet weak var chatView: UIView!
    
    let chatroomview = ChatViewController()
    
//    private var messages: [[String : String]] = []
//    private var messageListener: ListenerRegistration?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderImage()
        chatroomview.view.frame = chatView.bounds
        chatView.addSubview(chatroomview.view)
    }
    
    func setupHeaderImage() {
        headerImage.alpha = 0.7
        headerImage.contentMode = .scaleAspectFill
        let headerSize = mainheader.bounds.size
        headerImage.image = resizeImage(image: UIImage(named: "white_mountain")!, toSize: headerSize)
    }
    
    
}
