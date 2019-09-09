//
//  createEventViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 9/8/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class createEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var upperTableView: UITableView!
    
    let cellIdentifiers = ["titleFieldCell", "categoryCell", "segmentedCell"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers[indexPath.item], for: indexPath)
        if let titleCell = cell as? NewEventTitleTableViewCell {
            
        }
        if let segmentedCell = cell as? SegmentedControllerTableViewCell {
            
        }
        if let categoryCell = cell as? CategoryCellTableViewCell {
        }
        return cell
    }
    
    @IBAction func onCategoryButtonClicked(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upperTableView.delegate = self
        upperTableView.dataSource = self
        upperTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    

}
