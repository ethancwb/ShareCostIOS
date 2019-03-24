//
//  WeightTableViewCell.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/23/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class WeightTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var weightInput: CustomTextField!
    @IBOutlet weak var username: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
