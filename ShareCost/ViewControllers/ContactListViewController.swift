//
//  ContactListViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 2/23/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        let backgroundImage = addBackground()
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
