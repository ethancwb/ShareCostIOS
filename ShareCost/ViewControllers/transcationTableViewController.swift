//
//  transcationTableViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/30/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class transcationTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var transcationTable: UITableView!
    @IBOutlet weak var avatarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAvatarView()
        transcationTable.delegate = self
        transcationTable.dataSource = self
    }

    func setupAvatarView() {
        avatarButton.layer.cornerRadius = avatarButton.bounds.size.width / 2
        avatarButton.clipsToBounds = true
        avatarButton.setImage(UIImage(named:"avatar_icon_placeholder"), for: .normal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transcationCell", for:indexPath) as! transcationTableViewCell
        return cell
    }
    
}
