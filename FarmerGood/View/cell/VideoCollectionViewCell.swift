//
//  VideoCollectionViewCell.swift
//  StreetDance
//
//  Created by ucom Apple root S09 on 2019/7/10.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
class VideoCollectionViewCell: UICollectionViewCell {
    //data
    var sid = -1
    var slect = 0
    weak var delegate : VideoVC!
    @IBOutlet var myImage: UIImageView!
    @IBOutlet var myLabel: UILabel!
   
    
    override func awakeFromNib() {
      
    }

}
