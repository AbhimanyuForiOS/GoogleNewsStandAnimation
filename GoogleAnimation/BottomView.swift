//
//  Scroller.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit
class BottomView:UIView{

    
    var header:HeaderBottom!
    var tblHolder:TableHolder!
    
    
    convenience init(v:UIView? = UIView(),topV:UIView? = UIView()) {
        
        self.init()
        
        self.backgroundColor =  .white//UIColor.init(red: 255.0/255.0, green: 0.0, blue: 0.0, alpha: 0.15);
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        v!.addSubview(self);
        
        
        C.set(item: self, attri: .width, relatedBy: .equal, toItem: v!, attribute: .width, multiplier: 1.0, constant: 0, viewMain: v!);
        
        C.set(item: self, attri: .bottom, relatedBy: .equal, toItem: v!, attribute: .bottom, multiplier: 1.0, constant: 0, viewMain: v!);
        
        C.set(item: self, attri: .leading, relatedBy: .equal, toItem: v!, attribute: .leading, multiplier: 1.0, constant: 0, viewMain: v!);
        
        C.set(item: self, attri: .top, relatedBy: .equal, toItem: topV!, attribute: .bottom, multiplier: 1.0, constant:0, viewMain:v!);
        
        self.layoutIfNeeded()
        
        
        header = HeaderBottom.init(v: self);
        
        
        //Made card holder with cards
        self.tblHolder = TableHolder()
        self.tblHolder.setUpScrollerOnTop(v:self)
        
        
        
        
    }

}
