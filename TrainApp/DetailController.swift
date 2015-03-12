//
//  DetailController.swift
//  TrainApp
//
//  Created by 黄伟华 on 2/28/15.
//  Copyright (c) 2015 黄伟华. All rights reserved.
//

import UIKit
import GoogleMobileAds

class DetailController: UIViewController,GADInterstitialDelegate {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var bannerView: GADBannerView!
    var interstital:GADInterstitial = GADInterstitial()

    
    let baseUrl :String = "http://104.224.139.177/mysql.php"
    var viewCount : Int = 1
    var index = 0
   
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bannerView.adUnitID = "ca-app-pub-9740809110396658/7852446325"
        self.bannerView.rootViewController = self
        
        var deviceRequest:GADRequest = GADRequest()
//        deviceRequest.testDevices = ["59dacc3883b1287897acd50d68a2617275d9b323"]
        self.bannerView.loadRequest(deviceRequest)
        
        //请求全屏广告
        if viewCount%3 == 0{
            showInterstitial()
        }
        
        //请求文章
        loadRequest()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func loadRequest(){
        
        
        self.showHUDWithMessage("加载中...")
        var operation : AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        println(index)
        operation.GET(baseUrl, parameters: ["num":(index+1)], success: { (operation, respond) -> Void in
            
            
            var dictionary:NSDictionary = respond as NSDictionary

            var resultArray:NSArray = dictionary["result"] as NSArray
            if resultArray.count<=0 {
                self.hideHUDWithCompletionMessage("暂无数据，等待编辑添加")
                self.hideHUDWithCompletionMessage("暂无数据，等待编辑添加", finishedHandler:{
                    println()
                    
                    self.navigationController?.popViewControllerAnimated(true)
                    })
                return
            }
            

            self.hideHUD()
            
            var resultDic :NSDictionary = resultArray[0] as NSDictionary
            
            var title = resultDic["title"] as String
            var content = resultDic["post_content"] as String
            
            var url: NSURL = NSBundle.mainBundle().URLForResource("index", withExtension: "html")!
            var htmlString :String = NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil)!
            htmlString = htmlString.stringByReplacingOccurrencesOfString("%title%", withString: title)
            htmlString = htmlString.stringByReplacingOccurrencesOfString("%content%", withString: content)
            self.webView.loadHTMLString(htmlString, baseURL: nil)
        }) { (operation, error) -> Void in
            
            self.hideHUDWithCompletionMessage(error.description, finishedHandler:{
                println(error)
                self.navigationController?.popViewControllerAnimated(true)
            })
        }
        
        
    }
    /**

    *功能:展示全屏广告
    *限制:进入此viewController ，每三次展示一次
    */
    func showInterstitial(){
        println("展示全屏广告")
        
        interstital = GADInterstitial()
        interstital.adUnitID = "ca-app-pub-9740809110396658/4074721524"
        interstital.delegate = self
        var deviceRequest:GADRequest = GADRequest()
//        deviceRequest.testDevices = ["59dacc3883b1287897acd50d68a2617275d9b323"]
        interstital.loadRequest(deviceRequest)
    }
    func interstitialDidReceiveAd(ad: GADInterstitial!) {
        ad.presentFromRootViewController(self)
    }
    func interstitial(ad: GADInterstitial!, didFailToReceiveAdWithError error: GADRequestError!) {
        println("GAD \(error)")
    }
}
