//
//  RegisterPageViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/16/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var usernameField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    @IBOutlet weak var rePasswordField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = addBackground()
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
        self.setupToHideKeyboardOnTapOnView()
    }
    
    @IBAction func onCancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onRegister(_ sender: Any) {
        if let username = usernameField.text,
            let password = passwordField.text,
            let rePassword = rePasswordField.text {
            if username == "" || password == "" || rePassword == "" {
                let alert = UIAlertController(title: "Missing Fields", message: "Please fill all empty fields", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
            if password == rePassword {
                registerNewUser(username: username, password: password) { response in
                    if let user = response {
                        userSession.shared.setCurrentUser(user: user)
                        self.performSegue(withIdentifier: "loginAfterRegisterSegue", sender: nil)
                    }
                }
            } else {
                let alert = UIAlertController(title: "Password Error", message: "Password didn't match", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
}
