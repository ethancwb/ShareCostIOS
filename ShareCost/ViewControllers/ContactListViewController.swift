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
    public var isModalMode : Bool = false
    public var delegate : CalculatorViewController?
    @IBOutlet weak var addNewFriend: UIBarButtonItem!
    
    var dummy_users : [String] = []
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.isModalMode {
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .checkmark
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if self.isModalMode {
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .none
            }
        }
    }
    
    func setupModalView() {
        let leftButton = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: #selector(pressedCancel))
        let rightButton = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(pressedDone))
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func pressedCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressedDone() {
        if let selectedUsers = (FriendList.visibleCells.filter { $0.accessoryType == .checkmark }) as? [FriendsTableViewCell] {
            delegate?.selectedUsers = selectedUsers.map { $0.username.text ?? "" }
        }
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Friends"
        self.FriendList.delegate = self
        self.FriendList.dataSource = self
        self.FriendList.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (self.isModalMode) {
            self.navigationItem.largeTitleDisplayMode = .never
            setupModalView()
            self.FriendList.allowsMultipleSelection = true
            self.FriendList.allowsSelectionDuringEditing = true
        }
        let successBlock : () -> Void = {
            self.dummy_users = userSession.shared.acceptedListConnection.map {$0.displayName}
            self.FriendList.reloadData()
        }
        getUserFriendList(path: "friend/getfriend", successBlock: successBlock)
    }
    
    @IBAction func addFriend(_ sender: Any) {
        self.performSegue(withIdentifier: "addFriend", sender: nil)
    }
}
