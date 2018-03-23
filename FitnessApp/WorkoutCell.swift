//
//  WorkoutCell.swift
//  FitnessApp
//
//  Created by Pallav  on 3/22/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit

class WorkoutCell: UITableViewCell {

    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
