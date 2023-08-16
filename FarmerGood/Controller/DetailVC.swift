//
//  DetailVC.swift
//  FarmerGood
//
//  Created by user on 2020/10/5.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var photos = [Photo]()
    var row: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = photos[row]
        myLabel.text = data.title
        let url = data.imageUrl
        myImage?.kf.indicatorType = .activity
        myImage.kf.setImage(with: url)
    }
    
    @IBAction func share(_ sender: Any) {
        guard let image = myImage.image else { return }
        let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activity, animated: true)
    }
    
}
