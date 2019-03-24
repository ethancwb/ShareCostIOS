//
//  CalculatorViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 2/23/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class CalculatorViewController: TabBarSubViewsViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var transcationTitle: UITextField!
    @IBOutlet weak var totalAmount: UITextField!
    @IBOutlet weak var commentView: UITextView!
    var originalTextFieldColor: UIColor?
    var originalTextViewColor: UIColor?
    public var selectedUsers : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.searchController = nil
        self.navigationItem.title = "New Transcation"
        self.navigationController?.navigationBar.isHidden = true
        transcationTitle.delegate = self
        totalAmount.delegate = self
        commentView.delegate = self
        setupCommentPlaceholder()
        self.definesPresentationContext = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (selectedUsers != []) {
            self.performSegue(withIdentifier: "toSplitBill", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSplitBill" {
            if let vc = segue.destination as? SplitWeightViewController {
                vc.userList = self.selectedUsers
            }
        }
    }
    
    func setupCommentPlaceholder() {
        commentView.text = "Add comments (Optional):"
        commentView.textColor = UIColor(red:0.47, green:0.58, blue:0.62, alpha:1.0)
    }
    
    @IBAction func ContinuePressed(_ sender: Any) {
        guard let usersVC = self.storyboard?.instantiateViewController(withIdentifier: "contactList") as? ContactListViewController else { return }
        let navControler = UINavigationController(rootViewController: usersVC)
        navControler.navigationBar.tintColor = UIColor.white
        usersVC.isModalMode = true
        usersVC.delegate = self
        self.navigationController?.present(navControler, animated: true, completion: nil)
//        self.performSegue(withIdentifier: "selectUsers", sender: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField.isKind(of: UITextField.self)) {
            originalTextFieldColor = textField.backgroundColor
            textField.backgroundColor = originalTextFieldColor!.darker(by: 30)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = originalTextFieldColor
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = UIColor.white
        originalTextViewColor = textView.backgroundColor
        textView.backgroundColor = textView.backgroundColor?.darker(by: 30)
        if (textView.text == "") {
            setupCommentPlaceholder()
        } else if (textView.text == "Add comments (Optional):") {
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = originalTextViewColor
        if (textView.text == "") {
            setupCommentPlaceholder()
        }
    }
}

extension UIColor {
    
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}
