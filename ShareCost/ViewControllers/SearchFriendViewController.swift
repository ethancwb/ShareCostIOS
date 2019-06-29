//
//  SearchFriendViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 5/25/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class SearchFriendViewController: UIViewController {
    
    @IBOutlet weak var username: CustomTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onAdd(_ sender: Any) {
        let successBlock : () -> Void = {
            self.navigationController?.popViewController(animated: true)
        }
        addUser(userId: userSession.shared.currentUser?.identifier ?? "", requestName: username.text ?? "", successBlock: successBlock)
    }
}
