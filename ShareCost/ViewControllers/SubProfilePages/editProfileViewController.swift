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
    
    var isEditMode : Bool = false
    
    var editTableSectionHeaders : [String] = ["Username", "Password", "Email", "Phone"]
    
    var doneTableSectionHeaders : [String] = ["Username", "Password", "ReEnter Password", "Email", "Phone"]
    
    var userDictionary : [String : String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        userInfoTable.delegate = self
        userInfoTable.dataSource = self
        computeUserDictionary()
    }
    
    @objc func onEdit() {
        isEditMode = true
        self.userInfoTable.reloadData()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(onDone))
        self.view.layoutIfNeeded()
    }
    
    @objc func onDone() {
        isEditMode = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(onEdit))
        self.view.layoutIfNeeded()
        self.userInfoTable.reloadData()
    }
    
    func computeUserDictionary() {
        if let user = userSession.shared.getCurrentUser() {
            let mirror = Mirror(reflecting: user)
            for (_, attr) in mirror.children.enumerated() {
                if let key = attr.label,
                    let value = attr.value as? String {
                    userDictionary[key] = value
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        if let navcontroller = self.navigationController as? CustomNavigationBarViewController {
            navcontroller.setupTranslucent()
        }
        setupAvatarView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(onEdit))
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
        return isEditMode ? doneTableSectionHeaders.count : editTableSectionHeaders.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return isEditMode ? doneTableSectionHeaders[section] : editTableSectionHeaders[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for:indexPath) as! editProfileTableViewCell
        cell.inputField.placeholder = "Empty"
        cell.inputField.text = userDictionary[editTableSectionHeaders[indexPath.section].lowercased()]
        cell.inputField.clearButtonMode = isEditMode ? .always : .never
        cell.inputField.isUserInteractionEnabled = isEditMode
        return cell
    }

}
