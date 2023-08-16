//
//  ViewController.swift
//  FarmerSchool
//
//  Created by user on 2020/6/3.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit
import Alamofire

/// 頁面狀態
enum PageStatus {
    case LoadingMore
    case NotLoadingMore
}

class HomeVC: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    var List: [FarmerSchool] = []
    var newDataList: [FarmerSchool] = []
//    var activitys = [Activity]()
    let get = GetLoad()
    var pageStatus: PageStatus = .NotLoadingMore
    let fullScreenSize = UIScreen.main.bounds.size
    var skip : Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityView()
        requestData()
        self.navigationItem.title = "首頁"
    }
    
    func requestData(){
        startLoading()
        get.getSchool(classUrl: generateUrl()) { (data) in
            self.List = data
            self.stopLoading()
            //reload單行cell
            self.myTableView.reloadSections([1], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func generateUrl() -> String {
        return "https://data.coa.gov.tw/Service/OpenData/FromM/FarmerAcademyData.aspx?$top=20&$skip=\(skip)"
    }
}

extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            if newDataList.isEmpty {
                return List.count
            } else {
                return newDataList.count
            }
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell") as! ActivityCell
//            cell.collectionView.dataSource = self
//            cell.collectionView.delegate = self
//            // Clear up the array
//            activitys.removeAll(keepingCapacity: true)
//            cell.collectionView.reloadData()
//            // Pull data from Parse
//            let query = PFQuery(className: "activity")
//            //快取圖片
//            query.cachePolicy = PFCachePolicy.networkElseCache
//            query.findObjectsInBackground { (objects, error) -> Void in
//                if let error = error {
//                    print("Error: \(error) \(error.localizedDescription)")
//                    return
//                }
//                if let objects = objects {
//                    for (index, object) in objects.enumerated() {
//                        // Convert PFObject into Trip object
//                        let activity = Activity(pfObject: object)
//                        //設定 裝值用陣列與物件數量不相等才appen 反之數量相等則不做下面動動避免重複加入
//                        if self.activitys.count != objects.count{
//                            self.activitys.append(activity)
//                            let indexPath = IndexPath(row: index, section: 0)
//                            cell.collectionView.insertItems(at: [indexPath])
//                        }
//                    }
//                }
//            }
//
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeCell
            if newDataList.isEmpty {
                cell.className.text = List[indexPath.row].課程名稱
                cell.trainingCategory.text = List[indexPath.row].訓練別
                cell.startTime.text = List[indexPath.row].課程日期
                return cell
            }else{
                cell.className.text = newDataList[indexPath.row].課程名稱
                cell.trainingCategory.text = newDataList[indexPath.row].訓練別
                cell.startTime.text = newDataList[indexPath.row].課程日期
                return cell
            }
        }
    }
    
    // 設置 cell 的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 300
        }else{
            return 100
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "set"{
            let next = segue.destination as! ContentVC
            let row = myTableView.indexPathForSelectedRow!.row
            if newDataList.isEmpty{
                next.List = self.List
                next.row = row
            }else{
                next.List = self.newDataList
                next.row = row
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "活動資訊"
        case 1:
            return "課程資訊"
        default:
            return nil
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard scrollView.contentSize.height > self.myTableView.frame.height, self.pageStatus == .NotLoadingMore else { return }
        if scrollView.contentSize.height - (scrollView.frame.size.height + scrollView.contentOffset.y) <= -10 {
            self.pageStatus = .LoadingMore
            self.myTableView.reloadData(){
                // 模擬 Call API 的時間
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.skip += 20
                    print("skip = \(self.skip)")
                    self.requestData()
                    self.newDataList.append(contentsOf: self.List)
                    self.pageStatus = .NotLoadingMore
                    //self.tableView.reloadSections([1], with: UITableView.RowAnimation.automatic)
                }
            }
        }
    }
    
}

extension UITableView {
    func reloadData(completion:@escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
            { _ in completion() }
    }
}


//extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return activitys.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
//        cell.myImage.layer.borderWidth = 2
//        cell.myImage.layer.borderColor = UIColor.black.cgColor
//        cell.myImage.image = UIImage()
//        if let image = activitys[indexPath.row].image {
//            image.getDataInBackground(block: { (imageData, error) in
//                if let activityImageData = imageData {
//                    cell.myImage.image = UIImage(data: activityImageData)
//                }
//            })
//        }
//
//        return cell
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let next = self.storyboard?.instantiateViewController(withIdentifier: "activityViewController") as? activityVC {
//            guard let row = collectionView.indexPathsForSelectedItems?.first?.row else{ return }
//            next.activitys = self.activitys
//            next.row = row
//
//            if let image = activitys[indexPath.row].image {
//                image.getDataInBackground(block: { (imageData, error) in
//                    if let activityImageData = imageData {
//                        next.imageName = UIImage(data: activityImageData)
//                    }
//                })
//            }
//            self.navigationController?.pushViewController(next, animated: true)
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: Int(fullScreenSize.width), height: 220)
//    }
//}
