//
//  ContactListViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 2/23/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class ContactListViewController: TabBarSubViewsViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var FriendList: UITableView!
    
    var dummy_users = ["Paul", "Monica", "Lisa", "Bill", "Kevin", "Louise"]
    var dummy_balance = ["-$30.0", "$52.5", "-$34.2", "$72.8", "$12.0", "-$24.0"]
    var status = ["balance", "owed", "owed", "owed", "balance", "balance"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy_users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for:indexPath) as! FriendsTableViewCell
        cell.balance.text = "Balance:" + dummy_balance[indexPath.item]
        cell.username.text = dummy_users[indexPath.item]
        if let avatar = UIImage(named: "avatar_icon_placeholder") {
            cell.imageView?.image = resizeImage(image: avatar, toSize: CGSize.init(width: 65, height: 65))
        }
        cell.imageView?.clipsToBounds = true
        if (status[indexPath.item] == "balance") {
            cell.moneyStatus.textColor = UIColor(red:0.00, green:0.80, blue:0.40, alpha:1.0)
            cell.moneyStatus.text = status[indexPath.item]
        }
        if (status[indexPath.item] == "owed") {
            cell.moneyStatus.textColor = UIColor.red
            cell.moneyStatus.text = status[indexPath.item]
        }
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        return [delete]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Friends"
        self.FriendList.delegate = self
        self.FriendList.dataSource = self
    }
    
}
