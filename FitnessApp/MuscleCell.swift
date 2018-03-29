//
//  MuscleCell.swift
//  FitnessApp
//
//  Created by Anubhav Saxena on 3/29/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit

class MuscleCell: UITableViewCell {
    
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

