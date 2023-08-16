//
//  profileView.swift
//  FarmerGood
//
//  Created by user on 2020/10/5.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit

class profileView: UIView{
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mySegment: UISegmentedControl!
    @IBOutlet weak var countLabel: UILabel!
    
   
    weak var delegate: MyViewDelegate?
    
    
    @IBAction func onChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            delegate?.change(index: 0)
        }else{
            delegate?.change(index: 1)
        }
    }
    
}

protocol MyViewDelegate:class {
    
    func btnReload(text: String)
    
    func change(index: Int)
}
