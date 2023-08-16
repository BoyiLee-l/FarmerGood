//
//  UIViewController.swift
//  Agriculturalknowledge
//
//  Created by user on 2020/9/9.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit

var spinner: UIActivityIndicatorView = {
    let activityView = UIActivityIndicatorView()
    activityView.style = .gray
    return activityView
}()

extension UIViewController {
    
    //MARK:-ActivityView方法
    func setupActivityView(){
        view.addSubview(spinner)
        spinner.center = view.center
    }
    
    func startLoading(){
        spinner.startAnimating()
        spinner.isHidden = false
    }
    
    func stopLoading(){
        spinner.stopAnimating()
        spinner.isHidden = true
    }
    
    func alert(title: String, message: String){
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)
    }
}
