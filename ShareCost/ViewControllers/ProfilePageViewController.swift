//
//  ProfilePageViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 2/23/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var logoutSettingsTable: UITableView!
    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var profileSettingTable: UITableView!
    @IBOutlet weak var userBalanceField: UITextView!
    @IBOutlet weak var usernameField: UITextView!
    
    var profileSettings : [String] = [
        "My Profile",
        "All Transactions",
        "Friend Requests",
        "Contact Us"
    ]
    
    var logoutSettings : [String] = [
        "Logout",
        "Delete Account"
    ]
    
    var profileSegues : [String] = ["editProfile", "transcations", "newFriends", "contactus"]
    
    var logoutSegues = ["logout", "logout"]
    
    var avatarImage = UIImage(named:"avatar_icon_placeholder")
    
    var currentUser : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAvatarView()
        self.profileSettingTable.dataSource = self
        self.profileSettingTable.delegate = self
        self.logoutSettingsTable.dataSource = self
        self.logoutSettingsTable.delegate = self
        self.setupToHideKeyboardOnTapOnView()
        self.profileSettingTable.frame = CGRect(x: self.profileSettingTable.frame.origin.x, y: self.profileSettingTable.frame.origin.y, width: self.profileSettingTable.frame.size.width, height: self.profileSettingTable.contentSize.height)
        self.logoutSettingsTable.frame = CGRect(x: self.logoutSettingsTable.frame.origin.x, y: self.logoutSettingsTable.frame.origin.y, width: self.logoutSettingsTable.frame.size.width, height: self.logoutSettingsTable.contentSize.height)
    }
    
    override func viewDidLayoutSubviews() {
        self.profileSettingTable.frame = CGRect(x: self.profileSettingTable.frame.origin.x, y: self.profileSettingTable.frame.origin.y, width: self.profileSettingTable.frame.size.width, height: self.profileSettingTable.contentSize.height)
        self.logoutSettingsTable.frame = CGRect(x: self.logoutSettingsTable.frame.origin.x, y: self.profileSettingTable.frame.origin.y + self.profileSettingTable.contentSize.height+35, width: self.logoutSettingsTable.frame.size.width, height: self.logoutSettingsTable.contentSize.height)
        self.profileSettingTable.reloadData()
        self.logoutSettingsTable.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.setupUserInfo()
    }
    
    func setupUserInfo() {
        if let user = userSession.shared.getCurrentUser() {
            currentUser = user
            usernameField.text = "Username: \(currentUser?.username ?? "")"
        }
    }
    
    func setupAvatarView() {
        avatarButton.layer.cornerRadius = avatarButton.bounds.size.width / 2
        avatarButton.clipsToBounds = true
        avatarButton.setImage(avatarImage, for: .normal)
    }
    
    @IBAction func onAvatarClicked(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image_data = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
//        let imageData:Data = image_data!.pngData()!
//        let imageStr = imageData.base64EncodedString()
        self.avatarImage = image_data
        setupAvatarView()
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == profileSettingTable) {
            return self.profileSettings.count
        } else {
            return self.logoutSettings.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == profileSettingTable) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "generalSettingCell", for:indexPath)
            let item = self.profileSettings[indexPath.item]
            cell.textLabel?.text = item
            cell.imageView?.image = UIImage(named: "\(item.replacingOccurrences(of: " ", with: ""))Icon")
            cell.separatorInset = UIEdgeInsets.zero
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "generalSettingCell", for:indexPath)
            let item = self.logoutSettings[indexPath.item]
            cell.textLabel?.text = item
            cell.imageView?.image = UIImage(named: "\(item.replacingOccurrences(of: " ", with: ""))Icon")
            cell.separatorInset = UIEdgeInsets.zero
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let listSegues = tableView == profileSettingTable ? profileSegues : logoutSegues
        self.performSegue(withIdentifier: listSegues[indexPath.item], sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logout" {
            self.hidesBottomBarWhenPushed = true
        }
    }
    
}
