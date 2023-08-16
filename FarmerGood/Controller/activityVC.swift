//
//  activityViewController.swift
//  FarmerSchool
//
//  Created by user on 2020/6/5.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class activityVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var myMapView: MKMapView!
    var imageName : UIImage!
//    var activitys = [Activity]()
    var row: Int!
//    var name = ""
//    var date:String?
//    var address = ""
    var myLocationManager :CLLocationManager!
//    var x = 0.0
//    var y = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUi()
        
//        let activityData = activitys[row]
        myMapView.delegate = self
        // 地圖樣式
        myMapView.mapType = .standard
        // 允許縮放地圖
        myMapView.isZoomEnabled = true
        
        // 地圖預設顯示的範圍大小 (數字越小越精確)
        let latDelta = 0.05
        let longDelta = 0.05
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        // 設置地圖顯示的範圍與中心點座標
//        let center:CLLocation = CLLocation(
//            latitude: activityData.x, longitude: activityData.y)
//        let currentRegion:MKCoordinateRegion =
//          MKCoordinateRegion(
//            center: center.coordinate,
//            span: currentLocationSpan)
//        myMapView.setRegion(currentRegion, animated: true)
//        map()
    }
    
    
    
}
extension activityVC{
//    func setUi(){
//        let activityData = activitys[row]
//        myImage.image = imageName
//        myImage.layer.borderWidth = 2
//        myImage.layer.borderColor = UIColor.black.cgColor
//        nameLabel.text = activityData.name
//        dateLabel.text = activityData.date
//        addressLabel.text = activityData.address
//        myMapView.layer.borderWidth = 1.5
//        myMapView.layer.borderColor = UIColor.black.cgColor
//    }
//
//    func map(){
//        let activityData = activitys[row]
//        let objectAnnotation = MKPointAnnotation()
//        objectAnnotation.coordinate = CLLocation(
//            latitude: activityData.x,
//            longitude: activityData.y).coordinate
//        objectAnnotation.title = "\(activityData.address)"
//        objectAnnotation.subtitle =
//            "\(activityData.name)"
//        myMapView.addAnnotation(objectAnnotation)
//    }
}
