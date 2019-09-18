//
//  ContactUsViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 4/13/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit
import MessageUI

class ContactUsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var toEmailAddress = "ethancwb@foxmail.com"

    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var emailDetailField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupToHideKeyboardOnTapOnView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        if let navcontroller = self.navigationController as? CustomNavigationBarViewController {
            navcontroller.setupTranslucent()
        }
    }
    
    @IBAction func onSendEmail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([toEmailAddress])
            mail.setSubject(subjectField.text ?? "Support")
            mail.setMessageBody(emailDetailField.text, isHTML: false)
            present(mail, animated: true)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
