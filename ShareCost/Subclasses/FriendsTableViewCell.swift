//
//  FriendsTableViewCell.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/16/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var balance: UITextView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var moneyStatus: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
