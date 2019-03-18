//
//  ViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 2/23/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit
import Foundation

class loginPageViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var usernameField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = addBackground()
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.activityIndicator.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
//    @IBAction func sendrequest(_ sender: Any) {
//        getLoginFromString() { response in
//            self.navigationItem.title = response
//        }
//    }
    
//    @IBAction func passwordChanged(_ sender: Any) {
//        if (self.passwordField.text?.count > 0) {
//            self.passwordField
//        }
//    }
    @IBAction func onRegisterPressed(_ sender: Any) {
        self.activityIndicator.isHidden = false
        self.performSegue(withIdentifier: "registerSegue", sender: nil)
    }
    
    @IBAction func onLoginPressed(_ sender: Any) {
        self.activityIndicator.isHidden = false
        self.performSegue(withIdentifier: "userLoginSegue", sender: nil)

//        let username = "test"
//        let password = "test"
//        sendLoginInfo(username: username, password: password) { response in
////            self.performSegue(withIdentifier: "userLoginSegue", sender: nil)
//        }
    }
}

