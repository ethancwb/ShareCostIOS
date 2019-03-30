//
//  transcationTableViewCell.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/30/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class transcationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var transactionID: UILabel!
    @IBOutlet weak var transcationTitle: UILabel!
    @IBOutlet weak var From: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var comment: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
