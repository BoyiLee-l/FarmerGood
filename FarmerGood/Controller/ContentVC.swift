//
//  ContentViewController.swift
//  FarmerSchool
//
//  Created by user on 2020/6/3.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit

class ContentVC: UIViewController{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var courseDateLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var registrationTimeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var industryLabel: UILabel!
    @IBOutlet weak var quotaLabel: UILabel!
    @IBOutlet weak var courseContentLabel: UILabel!
    @IBOutlet weak var conditionLabel: UITextView!
    @IBOutlet weak var telLabel: UILabel!
    var List: [FarmerSchool] = []
    var row: Int = 0
    var name:String?
    var courseDate:String?
    var cost = 0
    var registrationTime:String?
    var status:String?
    var industry:String?
    var quota = 0
    var courseContent:String?
    var condition:String?
    var tel:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
        addborderWidth()
    }
    
    

}
extension ContentVC{
    
    func setInit(){
        let data = List[row]
        nameLabel.text = data.課程名稱
        courseDateLabel.text = data.課程日期
        costLabel.text = "\(data.課程費用 ?? 0)"
        registrationTimeLabel.text = data.報名時間
        statusLabel.text = data.開課狀態
        industryLabel.text = data.產業別
        quotaLabel.text = "\(data.名額 ?? 0)"
        courseContentLabel.text = data.課程內容
        if condition != ""{
            conditionLabel.text = data.資格條件
        }else{
            conditionLabel.text = "1.無特殊條件"
        }
        telLabel.text = data.聯絡資訊
    }
    
    func addborderWidth(){
        courseContentLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        courseContentLabel.numberOfLines = 0
        courseContentLabel.layer.borderColor = UIColor.brown.cgColor
        courseContentLabel.layer.borderWidth = 2
        
        conditionLabel.layer.borderColor = UIColor.brown.cgColor
        conditionLabel.layer.borderWidth = 2
        
        telLabel.layer.borderColor = UIColor.brown.cgColor
        telLabel.layer.borderWidth = 1.2
        telLabel.clipsToBounds = true
        telLabel.layer.cornerRadius = 15
        
        courseDateLabel.clipsToBounds = true
        courseDateLabel.layer.cornerRadius = 15
        costLabel.clipsToBounds = true
        costLabel.layer.cornerRadius = 15
        registrationTimeLabel.clipsToBounds = true
        registrationTimeLabel.layer.cornerRadius = 15
        statusLabel.clipsToBounds = true
        statusLabel.layer.cornerRadius = 15
        industryLabel.clipsToBounds = true
        industryLabel.layer.cornerRadius = 15
        quotaLabel.clipsToBounds = true
        quotaLabel.layer.cornerRadius = 15
        
    }
    
}
