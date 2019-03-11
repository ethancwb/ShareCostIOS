//
//  TabBarSubViewsViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/9/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class TabBarSubViewsViewController: UIViewController, UISearchResultsUpdating, UISearchControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = addBackground()
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
        self.setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let searchbar = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchbar
        searchbar.searchResultsUpdater = self
        searchbar.delegate = self
        self.navigationItem.searchController?.dimsBackgroundDuringPresentation = false
        self.navigationItem.searchController?.hidesNavigationBarDuringPresentation = false
    }

}
