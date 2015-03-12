//
//  TAListCell.swift
//  TrainApp
//
//  Created by 黄伟华 on 2/28/15.
//  Copyright (c) 2015 黄伟华. All rights reserved.
//

import UIKit

typealias LongPressBlock = () -> ()
class TAListCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    var longPressBlock : LongPressBlock?
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        var longGesture:UILongPressGestureRecognizer  = UILongPressGestureRecognizer()
        longGesture.addTarget(self,action:"longPress")
        self.addGestureRecognizer(longGesture)
        super.awakeFromNib()
    }
    
    func longPress(){
        println("长按")
        
        if let existBlock = self.longPressBlock
        {
            self.longPressBlock!()
        }
    }
}