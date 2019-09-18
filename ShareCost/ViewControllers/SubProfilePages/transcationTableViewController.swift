//
//  transcationTableViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/30/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class transcationTableViewController: TabBarSubViewsViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var transcationTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        transcationTable.delegate = self
        transcationTable.dataSource = self
        self.setupToHideKeyboardOnTapOnView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "All Transcations"
        if let navcontroller = self.navigationController as? CustomNavigationBarViewController {
            navcontroller.setupNormal()
            self.setupNavigationBar()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transcationCell", for:indexPath) as! transcationTableViewCell
        return cell
    }
    
}
