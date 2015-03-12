//
//  ViewController.swift
//  TrainApp
//
//  Created by 黄伟华 on 2/28/15.
//  Copyright (c) 2015 黄伟华. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var reviewCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var h: CGFloat = 0
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var isShowed:Bool = NSUserDefaults.standardUserDefaults().boolForKey("isFirstShow")
        if isShowed == false
        {
            var alert:UIAlertView = UIAlertView(title: "提示", message: "长按某个课程后，会出现白色边框来记录当前课程", delegate: nil, cancelButtonTitle: "我知道了~")
            alert.show()
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isFirstShow")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    var listArray :[String] = [
        "http://cdn.neonan.com/uploads/bf6b0f7f-10d1-4c3e-8365-447c28f5b2ee.jpg_940",
        "http://cdn.neonan.com/uploads/9cef6de0-0318-4cae-a820-30dcdab8533b.jpg_940",
        "http://cdn.neonan.com/uploads/2da37336-4eee-4447-be13-a23011a3f719.jpg_940",
        "http://cdn.neonan.com/uploads/4ff29a61-d968-47c7-a1ec-b2b13310cba8.jpg_940",
        "http://cdn.neonan.com/uploads/33fb4930-b735-499e-b6a4-9876c2d18cc4.jpg_940",
        "http://cdn.neonan.com/uploads/5d86e6ab-8743-46ba-a750-accd8590e990.jpg_940",
        "http://cdn.neonan.com/uploads/ad75f9e4-40ef-4659-9581-2539f34ab5a0.jpg_940",
        "http://cdn.neonan.com/uploads/9a626880-4766-4663-a8f2-36a6d038c280.jpg_940",
        "http://cdn.neonan.com/uploads/95e5a80b-9092-47d0-82f9-de2be244fa8f.jpg_940",
        "http://cdn.neonan.com/uploads/ce56799e-6c33-4358-8e1b-071bf4e2357f.jpg_940",
        "http://cdn.neonan.com/uploads/f20412d2-18f5-460a-9b48-405ff0dfbec1.jpg_940",
        "http://cdn.neonan.com/uploads/2777f5c3-1bc1-4d87-b187-e9cd86b67222.jpg_940",
        "http://cdn.neonan.com/uploads/0c0af634-680b-4f49-a411-9eac9199a135.jpg_940",
        "http://cdn.neonan.com/uploads/03cf6e89-4c6b-41d8-9423-843b393a2dde.jpg_940",
        "http://cdn.neonan.com/uploads/cf6397b7-dea9-463d-a47b-3168f83dc57c.jpg_940",
        "http://cdn.neonan.com/uploads/40425377-7836-4cc2-a246-be65248eb842.jpg_940",
        "http://cdn.neonan.com/uploads/535c2e72-f334-464b-a615-9b78b4d7ed94.jpg_940",
        "http://cdn.neonan.com/uploads/c1896518-07e2-4f7f-91cb-b53a0777d46f.jpg_940",
        "http://cdn.neonan.com/uploads/8b997cbd-69f8-493c-84f8-3ab1119a4f66.jpg_940",
        "http://cdn.neonan.com/uploads/1216ac63-b38a-49ec-a184-bebf516bc8a3.jpg_940",
        "http://cdn.neonan.com/uploads/34b407a8-d11a-4d46-a0a3-8faeef3cb318.jpg_940",
        "http://cdn.neonan.com/uploads/2261cdca-94c2-4e4f-87b4-df3ee7a8f2da.jpg_940",
        "http://cdn.neonan.com/uploads/1166ad7b-ab56-47b3-ac87-610e88dd30ed.jpg_940",
        "http://cdn.neonan.com/uploads/a7e016c3-6c73-4600-a09e-2bd958b53d9d.jpg_940",
        "http://cdn.neonan.com/uploads/43180d3c-899f-4ed3-9f7d-cef5f5613b11.jpg_940",
        "http://cdn.neonan.com/uploads/9ee498c3-c63c-49b8-a6ae-2b61e22a708c.jpg_940",
        "http://cdn.neonan.com/uploads/ff4b5e3d-2f60-411b-a9fa-c717725af827.jpg_940",
        "http://cdn.neonan.com/uploads/ff4b5e3d-2f60-411b-a9fa-c717725af827.jpg_940",
        "http://cdn.neonan.com/uploads/0c9ebf22-ed9d-4d46-94bc-8a8cfa1b379c.jpg_940",
        "http://cdn.neonan.com/uploads/25fbdc97-c42c-4fe5-b1a3-a05f0cca9051.jpg_940",
    ]
    
    
    var videoList:[String] = [
        "http://k.youku.com/player/getFlvPath/sid/642544929224312468dd8_01/st/flv/fileid/030002010054436CE809B104A4526E676C14AA-00AE-1335-130E-2AA9FE8B4D2F?K=d232f63d73416d4a261e358e&hd=0&myp=0&ts=147&ypp=0&ctype=12&ev=1&token=6257&oip=1931268481&ep=dCaWH02JX8wJ5yHbiz8bYyrqICMHXP4J9h%2BFg9JjALshTOy8n02kz525PP5CEogddyAAZe32raPmbjFlYfBD2B0Q3k2rPPrh%2FfCW5a8itZl2ExFEdrnVwlSYQTX2",
        "http://k.youku.com/player/getFlvPath/sid/142528240625012890a4e_01/st/mp4/fileid/0300080100542A95F09E2E04A4526EEC188233-C9E5-7B1D-CC84-22FA430FC381?K=6d77a9182436241724121f97&hd=1&myp=0&ts=122&ypp=0&ctype=12&ev=1&token=1253&oip=1931268481&ep=cyaWH0uFVMoA4yHaiD8bbyXiJXNaXP4J9h%2BFidJjALshTOrOkDunx5TFTIpCEogddyAAZZ6CqtjvaEMXYYNK3G0Q2DypTfqTjfjn5a9RsuEEZRlAAc7ftVSfQTXy"
    ]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(PixOfWidth(120.00))
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> TAListCell {
        var identify :NSString = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as TAListCell
        
        var picture:String = listArray[indexPath.row]
        var url :NSURL = NSURL(string: picture)!
        cell.coverImageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "placeholder"))
        
        
        var selectIndex = NSUserDefaults.standardUserDefaults().integerForKey("mark");
        if indexPath.row == selectIndex
        {
            cell.layer.borderWidth = 2.5
            cell.layer.borderColor = UIColor.whiteColor().CGColor
            cell.layer.shadowOffset = CGSizeMake(1, 2)
        }else
        {
            cell.layer.borderWidth = 0.3
            cell.layer.borderColor = UIColor.darkGrayColor().CGColor
        }
        
        
        cell.longPressBlock = {
            () -> () in
            NSUserDefaults.standardUserDefaults().setInteger(indexPath.row, forKey: "mark")
            self.tableView.reloadData()
        }
        
        
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        super.prepareForSegue(segue, sender: sender)
        
        if sender is UIBarButtonItem
        {
            return;
        }
        if sender is UITableViewCell
        {
            reviewCount++
            
            var indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow()!
            var detailVC: DetailController = segue.destinationViewController as DetailController
            detailVC.index = indexPath.row
            detailVC.viewCount = reviewCount
        }
    }
    
}

