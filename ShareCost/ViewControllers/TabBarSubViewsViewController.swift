//
//  TabBarSubViewsViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/9/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class TabBarSubViewsViewController: UIViewController, UISearchResultsUpdating, UISearchControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupToHideKeyboardOnTapOnView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = getHeaderColor()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let searchbar = UISearchController(searchResultsController: nil)
        if let searchfield = searchbar.searchBar.value(forKey: "searchField") as? UITextField {
            searchfield.backgroundColor = UIColor.white
            let searchbarBackground = searchfield.subviews.first
            searchbarBackground?.backgroundColor = UIColor.white
            searchbarBackground?.layer.cornerRadius = 10
            searchbarBackground?.clipsToBounds = true
        }
        self.navigationItem.searchController = searchbar
        searchbar.searchResultsUpdater = self
        searchbar.delegate = self
        self.navigationItem.searchController?.dimsBackgroundDuringPresentation = false
        self.navigationItem.searchController?.hidesNavigationBarDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }

}
