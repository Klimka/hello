//
//  TableViewCell.swift
//  iOS-App-Lesson1
//
//  Created by Клим Зелинский on 27.10.17.
//  Copyright © 2017 Клим Зелинский. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
