//
//  LikeViewController.swift
//  Agriculturalknowledge
//
//  Created by user on 2020/7/1.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit
import Charts



class PriceVC: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let get = GetLoad()
    var vegetableList = [Vegetable]()
    
    var sections = [GroupedSection<String, Vegetable>]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityView()
        resquestData()
        setTableView()
    }
 
    func resquestData(){
        startLoading()
        get.getVegetable(vegatableUrl: vegatableURL) { (data) in
            self.vegetableList = data
            self.vegetableList = self.vegetableList.sorted{$0.作物名稱 ?? "" > $1.作物名稱 ?? ""}
            self.sections = GroupedSection.group(rows: self.vegetableList, by: { $0.市場名稱 ?? ""})
            self.sections.sort { (lhs, rhs) -> Bool in
                lhs.sectionItem < rhs.sectionItem
            }
            self.stopLoading()
            self.myTableView.reloadData()
        }
    }
}



extension PriceVC{
    
    func setTableView(){
        myTableView.delegate = self
        myTableView.dataSource = self
        
        self.navigationItem.title = "本日市場價格"
    }
    
}

extension PriceVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        return section.sectionItem
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections[section]
        return section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PriceCell
        let section = self.sections[indexPath.section]
        let data = section.rows[indexPath.row]
        cell.作物名稱.text = data.作物名稱
        let price = (data.上價 ?? 0.0)
        let price2 = (data.中價 ?? 0.0)
        let price3 = (data.下價 ?? 0.0)
        
        cell.setChart(values: price, values2: price2, values3: price3)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.backgroundView?.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        header.textLabel?.frame = header.frame
        header.textLabel?.textAlignment = .center
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

