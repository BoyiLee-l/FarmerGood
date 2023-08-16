//
//  avViewController.swift
//  StreetDance
//
//  Created by ucom Apple root S09 on 2019/7/11.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import Kingfisher
class PlayerVC: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myActivityIndicatorView:UIActivityIndicatorView!
    
    var urls = ""
    let fullScreenSize = UIScreen.main.bounds.size
    var messageList: Message?
    let get = GetLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        webInit()
    }
    
    func generateUrl() -> String {
        return "https://www.googleapis.com/youtube/v3/commentThreads?part=snippet,replies&videoId=\(urls)&key=AIzaSyC5fUiK9GiIUZgVpHvNB-H9Wuu8Kf-wbIk"
    }
    
    func requestData(){
        get.getMes(mesUrl: generateUrl()) { (data) in
            self.messageList = data
            self.tableView.reloadData()
        }
    }
    
}

extension PlayerVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerCell
        cell.name.text = messageList?.items?[indexPath.row].snippet?.topLevelComment?.snippet?.authorDisplayName
        cell.content.text = messageList?.items?[indexPath.row].snippet?.topLevelComment?.snippet?.textDisplay
        let urls = messageList?.items?[indexPath.row].snippet?.topLevelComment?.snippet?.authorProfileImageUrl
        cell.photo?.kf.setImage(with: URL(string: urls ?? ""))
        cell.photo.clipsToBounds = true
        cell.photo.layer.cornerRadius = cell.photo.frame.height/2
        return cell
    }
    
    //table小標題
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "評論"
    }
}

extension PlayerVC: WKNavigationDelegate{
    func webInit(){
        webView.navigationDelegate = self
        webView.loadHTMLString("<iframe width='100%' height='100%' src='https://www.youtube.com/embed/\(urls)' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>", baseURL: nil)
        
    }
    //  載入時執行
    func webView(_ webview: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        myActivityIndicatorView.startAnimating()
    }
    
    func webView(_ webview: WKWebView, didFinish navigation: WKNavigation!){
        myActivityIndicatorView.stopAnimating()
    }
}
