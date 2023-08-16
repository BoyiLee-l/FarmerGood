//
//  Trip.swift
//  TripCard
//
//  Created by Simon Ng on 9/11/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

//struct Activity{
//    var tripId = ""
//    var name = ""
//    var date = ""
//    var address = ""
//    var image: PFFileObject?
//    var tel = ""
//    var x = 0.0
//    var y = 0.0
//    init(tripId: String, name: String, date: String, address: String,image: PFFileObject!, tel: String, x: Double, y: Double) {
//        self.tripId = tripId
//        self.name = name
//        self.date = date
//        self.address = address
//        self.image = image
//        self.tel = tel
//        self.x = x
//        self.y = y
//    }
//    
//    init(pfObject: PFObject) {
//        self.tripId = pfObject.objectId!
//        self.name = pfObject["name"] as! String
//        self.date = pfObject["date"] as! String
//        self.address = pfObject["address"] as! String
//        self.tel = pfObject["tel"] as! String
//        self.image = pfObject["image"] as? PFFileObject
//        self.x = pfObject["x"] as! Double
//        self.y = pfObject["y"] as! Double
//    }
//    
//    func toPFObject() -> PFObject {
//        let tripObject = PFObject(className: "activity")
//        tripObject.objectId = tripId
//        tripObject["name"] = name
//        tripObject["date"] = date
//        tripObject["image"] = image
//        tripObject["address"] = address
//        tripObject["tel"] = tel
//        tripObject["x"] = x
//        tripObject["y"] = y
//        return tripObject
//    }
//}
