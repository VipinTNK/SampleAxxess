//
//  RecordsTableViewCell.swift
//  Axxess
//
//  Created by iOS TNK on 21/08/20.
//  Copyright © 2020 iOS TNK. All rights reserved.
//

import UIKit

class RecordsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var idLabel : UILabel!
    @IBOutlet weak var typeLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var dataLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
