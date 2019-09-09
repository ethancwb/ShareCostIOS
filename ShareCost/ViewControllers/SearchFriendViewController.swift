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
        let successBlock : (Any?) -> Void = { _ in
            self.navigationController?.popViewController(animated: true)
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: "Request sent", message: "The invitation has been successfully sent, please wait for the user to confirm the request.", preferredStyle: .alert)
                let done = UIAlertAction(title: "Done", style: .default, handler: nil)
                alertController.addAction(done)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        if let searchName = username.text,
            let userId = userSession.shared.currentUser?.identifier {
            addUser(userId: userId, requestName: searchName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines), successBlock: successBlock) {
                let alertController = UIAlertController(title: "Can't find user", message: "The username doesn't match any user, please enter again", preferredStyle: .alert)
                let done = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(done)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
