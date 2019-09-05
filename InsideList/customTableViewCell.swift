//
//  customTableViewCell.swift
//  InsideList
//
//  Created by Muhammad Mujahid on 01/09/2019.
//  Copyright © 2019 Muhammad Mujahid. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var englishName: UILabel!
    @IBOutlet weak var view_baseView: UIView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var arabicMeaning: UILabel!
    @IBOutlet weak var englishMeaning: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
