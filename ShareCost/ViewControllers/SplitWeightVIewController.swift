//
//  SplitWeightVIewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/23/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class SplitWeightViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var userWeightTable: UITableView!
    public var userList : [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weightCell", for: indexPath) as! WeightTableViewCell
        if let avatar = UIImage(named: "avatar_icon_placeholder") {
            cell.avatar.image = resizeImage(image: avatar, toSize: CGSize.init(width: 65, height: 65))
        }
        cell.avatar.clipsToBounds = true
        cell.username.text = userList[indexPath.item]
        cell.weightInput.text = String(Double(1 / userList.count))
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = false
        userWeightTable.delegate = self
        userWeightTable.dataSource = self
        self.navigationItem.largeTitleDisplayMode = .never
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        super.viewWillAppear(animated)
    }
    
    func setupDoneButton() {
        let doneButton = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(onDone))
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func onDone() {
        _ = navigationController?.popViewController(animated: true)
    }
}
