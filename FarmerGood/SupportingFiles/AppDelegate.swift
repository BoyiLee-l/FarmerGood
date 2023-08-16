//
//  AppDelegate.swift
//  mao_pen_template
//
//  Created by user on 2019/10/16.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        let navigationBarColor =  UINavigationBar.appearance()
        navigationBarColor.barTintColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        navigationBarColor.tintColor = .black
        let tabBarColor = UITabBar.appearance()
        tabBarColor.barTintColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        tabBarColor.tintColor = .black
//        let configuration = ParseClientConfiguration {
//            $0.applicationId = "hMcUTMQNu8UD87weaGHGwXaOhhC2WDTNSDJyjvHE"
//            $0.clientKey = "oMQlrUYcGfdfBo4epK9ZKQPm3pYmAeHItHr57Ppt"
//            $0.server = "https://parseapi.back4app.com/"
//        }
//        Parse.initialize(with: configuration)
      
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
       
    }
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {
     
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
      
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
     
    }
    
}
