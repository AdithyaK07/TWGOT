//
//  KingsListTableViewCell.swift
//  TWGOT
//
//  Created by mac on 06/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import UIKit

class KingsListTableViewCell: UITableViewCell {
    @IBOutlet weak var kingLogo: UIImageView!
    @IBOutlet weak var kingNameLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var victoryScoreLabel: UILabel!
    @IBOutlet weak var attacksScoreLabel: UILabel!
    @IBOutlet weak var defendsScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
