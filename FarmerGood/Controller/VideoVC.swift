//
//  VideoViewController.swift
//  StreetDance
//
//  Created by ucom Apple root S09 on 2019/7/10.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class VideoVC: UIViewController,UISearchBarDelegate{
    //sql使用變數
    var urlss = ""
    var searchName = ""
    //api端使用變數
    let get = GetLoad()
    var youtubelist: YoutubeApi?
    let fullScreenSize = UIScreen.main.bounds.size
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(traitCollection)")
        setupActivityView()
        requestData()
        self.navigationItem.title = "相關視頻"
    }
    
    @IBAction func like(_ sender: Any) {
        let controller = UIAlertController(title: "收藏功能開發中!", message: "敬請期待", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
    
    func requestData(){
        startLoading()
        get.getVideo(videoUrl: videoURl) { (data) in
            self.youtubelist = data
            self.stopLoading()
            self.collectionView.reloadData()
        }
    }
    
    
}
extension VideoVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return youtubelist?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VideoCollectionViewCell
        //抓取並且顯示資料庫圖片文字
        
        cell.myLabel.text = youtubelist?.items[indexPath.row].snippet.title
        let urls = youtubelist?.items[indexPath.row].snippet.thumbnails.high?.url
        print(urls!)
        cell.myImage?.kf.setImage(with: URL(string: urls ?? ""))
        cell.myImage.layer.borderColor = UIColor.brown.cgColor
        cell.myImage.layer.borderWidth = 1.5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let next = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as? PlayerVC {
            guard let data = youtubelist?.items[indexPath.row].contentDetails else { return }
            //傳送data網址
            next.urls = String(data.videoId)
            print(next.urls)
            //跳頁
            self.navigationController?.pushViewController(next, animated: true)
        }
    }
}
extension VideoVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Int(fullScreenSize.width)/2-20, height: 240)
    }
    
}
