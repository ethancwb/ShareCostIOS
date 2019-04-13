//
//  editProfileViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/30/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class editProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userInfoTable: UITableView!
    @IBOutlet weak var avatarButton: UIButton!
    
    var tableSectionHeader : [String] = ["Username", "Password", "Re-enter password", "Email", "Phone", "Paypal Account"]
    var userInfos = ["alice", "********", "", "alice@gmail.com", "7178340924", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        userInfoTable.delegate = self
        userInfoTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        if let navcontroller = self.navigationController as? CustomNavigationBarViewController {
            navcontroller.setupTranslucent()
        }
        setupAvatarView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupAvatarView() {
        avatarButton.layer.cornerRadius = avatarButton.bounds.size.width / 2
        avatarButton.clipsToBounds = true
        avatarButton.setImage(UIImage(named:"avatar_icon_placeholder"), for: .normal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSectionHeader.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableSectionHeader[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for:indexPath) as! editProfileTableViewCell
        cell.inputField.text = userInfos[indexPath.section]
        return cell
    }

}
