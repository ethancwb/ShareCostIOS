//
//  NewFriendTableViewCell.swift
//  ShareCost
//
//  Created by Wenbin Chen on 4/13/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class NewFriendTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var accetButton: CustomCellButton!
    @IBOutlet weak var rejectButton: CustomCellButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
