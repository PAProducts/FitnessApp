//
//  TableViewCell.swift
//  FitnessApp
//
//  Created by Pallav  on 3/21/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var setsCount: UILabel!
    @IBOutlet weak var repsCount: UILabel!
    @IBOutlet weak var workoutName: UILabel!
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
