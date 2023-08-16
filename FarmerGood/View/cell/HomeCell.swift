//
//  photoCell.swift
//  FarmerSchool
//
//  Created by user on 2020/6/3.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var trainingCategory: UILabel!
    @IBOutlet weak var startTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
