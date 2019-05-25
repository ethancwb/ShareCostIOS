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
    
    @IBAction func onRegisterPressed(_ sender: Any) {
        self.activityIndicator.isHidden = false
        self.performSegue(withIdentifier: "registerSegue", sender: nil)
    }
    
    @IBAction func onLoginPressed(_ sender: Any) {
        self.activityIndicator.isHidden = false
        if let username = usernameField.text,
            let password = passwordField.text {
            sendLoginInfo(username: username, password: password) { response in
                if let user = response {
                    userSession.shared.setCurrentUser(user: user)
                    self.performSegue(withIdentifier: "userLoginSegue", sender: nil)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userLoginSegue" {
            navigationController?.viewControllers = []
        }
    }
}

