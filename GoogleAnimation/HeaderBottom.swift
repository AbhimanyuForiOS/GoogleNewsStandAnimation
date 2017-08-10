//
//  HeaderBottom.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 08/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit
class HeaderBottom:UIView{
    
    
    
    
    
    convenience init(v:BottomView!) {
        
        self.init()
        
        self.backgroundColor =  .white//UIColor.init(red: 255.0/255.0, green: 0.0, blue: 0.0, alpha: 0.15);
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        v!.addSubview(self);
        
        
        C.set(item: self, attri: .width, relatedBy: .equal, toItem: v!, attribute: .width, multiplier: 1.0, constant: 0, viewMain: v!);
        
        C.set(item: self, attri: .height, relatedBy: .equal, toItem:nil, attribute: .notAnAttribute, multiplier: 1.0, constant: SCREEN_WIDTH*0.15, viewMain: v!);
        
        C.set(item: self, attri: .leading, relatedBy: .equal, toItem: v!, attribute: .leading, multiplier: 1.0, constant: 0, viewMain: v!);
        
        C.set(item: self, attri: .top, relatedBy: .equal, toItem: v!, attribute: .top, multiplier: 1.0, constant:0, viewMain:v!);
        
          self.layoutIfNeeded()
          self.layer.shadowOffset = CGSize(width: 5, height: 5);
          self.layer.shadowColor = UIColor.darkGray.cgColor
          self.layer.shadowOpacity = 0.7;
          self.layer.shadowRadius = 5;
        
        
        
    }
    
}
