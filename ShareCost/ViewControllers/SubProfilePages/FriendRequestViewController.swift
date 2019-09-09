//
//  FriendRequestViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 4/13/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit
import Foundation

class FriendRequestViewController: TabBarSubViewsViewController, UITableViewDelegate, UITableViewDataSource {
    
    var newFriendsList : [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newFriendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newFriendCell", for:indexPath) as! NewFriendTableViewCell
        cell.username.text = newFriendsList[indexPath.item]
        if let avatar = UIImage(named: "avatar_icon_placeholder") {
            cell.imageView?.image = resizeImage(image: avatar, toSize: CGSize.init(width: 50, height: 50))
        }
        cell.imageView?.clipsToBounds = true
        cell.separatorInset = UIEdgeInsets.zero
        cell.accetButton.indexPath = indexPath
        cell.rejectButton.indexPath = indexPath
        return cell
    }
    
    @IBOutlet weak var friendTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        friendTableView.delegate = self
        friendTableView.dataSource = self
        self.navigationItem.largeTitleDisplayMode = .never
        friendTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Friend Requests"
        self.navigationController?.navigationBar.isHidden = false
        if let navcontroller = self.navigationController as? CustomNavigationBarViewController {
            navcontroller.setupNormal()
            self.setupNavigationBar()
        }

        let successBlock : () -> Void = {
            self.newFriendsList = userSession.shared.pendingListConnection.map {$0.displayName}
            self.friendTableView.reloadData()
        }
        getUserFriendList(path: "friend/getpending", successBlock: successBlock)
    }
    
    @IBAction func onAccept(_ sender: Any) {
        if let cellButton = sender as? CustomCellButton,
            let ipath = cellButton.indexPath {
            self.newFriendsList.remove(at: ipath.item)
            friendTableView.deleteRows(at: [ipath], with: .automatic)
        }
    }
    
    @IBAction func onReject(_ sender: Any) {
        if let cellButton = sender as? CustomCellButton,
            let ipath = cellButton.indexPath {
            self.newFriendsList.remove(at: ipath.item)
            friendTableView.deleteRows(at: [ipath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
