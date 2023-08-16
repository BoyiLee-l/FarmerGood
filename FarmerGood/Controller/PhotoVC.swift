//
//  PhotoVC.swift
//  FarmerGood
//
//  Created by user on 2020/10/5.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit

enum CellStatus{
    case Photo
    case Camera
}

class PhotoVC: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    var searchController: UISearchController!
    var getFile = GetLoad()
    var photos = [Photo]()
    var cellStatus: CellStatus = .Photo
    let fullScreenSize = UIScreen.main.bounds.size
    var text: String = "agriculture"
    var count: Int = 0
    let profileView = UINib(nibName: "profileView", bundle: nil).instantiate(withOwner: self, options: nil).first as! profileView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        respondsCode()
        setupActivityView()
        self.navigationItem.title = "農村生活"
    }
    
    func generateUrl() -> String {
        return "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=b4539cf0ba4b24f0ecc1e92331e6b76f&text=\(text)&per_page=500&format=json&nojsoncallback=1"
    }
    
    func respondsCode(){
        if cellStatus == .Photo{
            if let url = URL(string: generateUrl()){
                startLoading()
                getFile.fetchData(url: url) { (data) in
                    self.photos = data.photos.photo
                    print(self.count)
                    DispatchQueue.main.async {
                        self.profileView.countLabel.text = "歡迎一同來感受農村生活最樸實最簡單的生活美🌾"
                        self.profileView.myLabel.text = "Farm life"
                        let url = self.photos.first?.imageUrl
                        self.profileView.myImage?.kf.indicatorType = .activity
                        self.profileView.myImage?.kf.setImage(with: url)
                        self.stopLoading()
                        self.myCollectionView.reloadData()
                    }
                }
            }else{
                alert(title: "No results", message: "Please re-enter keywords")
            }
        }else{
            self.myCollectionView.reloadData()
        }
    }
    
    //MARK:collectionVIew畫面初始
    func setCollectionView(){
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        //MARK:collectionVIew掛xib及xib元件實作
        
       // profileView.frame = CGRect(x: 0, y: 0, width: fullScreenSize.width, height: 300)
        profileView.myImage.layer.borderWidth = 1.3
        profileView.myImage.layer.borderColor = #colorLiteral(red: 0.97002522, green: 0.6438448911, blue: 1, alpha: 1)
        profileView.myImage.clipsToBounds = true
        profileView.myImage.layer.cornerRadius = profileView.myImage.frame.height/2
        //MARK:delegate傳值實作
        profileView.delegate = self
        //MARK:collection版型設定
        profileView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.addSubview(profileView)
        profileView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        profileView.leadingAnchor.constraint(equalTo: myCollectionView.frameLayoutGuide.leadingAnchor).isActive = true
        profileView.trailingAnchor.constraint(equalTo: myCollectionView.frameLayoutGuide.trailingAnchor).isActive = true
        let topConstraint = profileView.topAnchor.constraint(equalTo: myCollectionView.contentLayoutGuide.topAnchor)
        topConstraint.priority = UILayoutPriority(999)
        topConstraint.isActive = true
        profileView.bottomAnchor.constraint(greaterThanOrEqualTo: myCollectionView.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        let width = myCollectionView.bounds.width / 3.3 - 8
        let flowLayout = myCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        flowLayout?.itemSize = CGSize(width: width, height: width)
        flowLayout?.estimatedItemSize = .zero
    }
}

extension PhotoVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCell
        cell.layer.borderWidth = 1.3
        cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.isHidden = false
        if cellStatus == .Photo{
            let url = photos[indexPath.row].imageUrl
            cell.imageView?.kf.indicatorType = .activity
            cell.imageView.kf.setImage(with: url)
        }else{
            cell.isHidden = true
            alert(title: "敬請期待", message: "尚未開放本功能")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        let row = myCollectionView.indexPathsForSelectedItems?.first?.row
        next.photos = self.photos
        next.row = row ?? 0
        present(next, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
    }
}

extension PhotoVC: MyViewDelegate{
    func change(index: Int) {
        if index == 0{
            cellStatus = .Photo
            respondsCode()
        }else{
            cellStatus = .Camera
            respondsCode()
        }
    }
    
    func btnReload(text: String) {
        self.text = text
        respondsCode()
    }
}
