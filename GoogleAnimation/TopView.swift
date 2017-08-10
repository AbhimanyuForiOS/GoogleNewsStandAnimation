//
//  TopView.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit
class TopView:UIView{
    
    var cardHolder:CardHolder!
    
    convenience init(v:UIView? = UIView()) {
        
        self.init()
        
         self.backgroundColor = .clear//UIColor.init(red: 0.0/255.0, green: 0.0, blue: 0.0, alpha: 0.15);
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        v!.addSubview(self);
        
        
        C.set(item: self, attri: .width, relatedBy: .equal, toItem: v!, attribute: .width, multiplier: 1.0, constant: 0, viewMain: v!);
        
        
        Animator.shared.config.topHeaderHeightConstraint =   C.get(item: self, attri: .height, relatedBy: .equal, toItem: nil,
                                                                   attribute: .notAnAttribute, multiplier: 1.0, constant: Animator.shared.config.mid_Header_h!,
                                                                   viewMain: v!);
        
        
        C.set(item: self, attri: .leading, relatedBy: .equal, toItem: v!, attribute: .leading, multiplier: 1.0, constant: 0, viewMain: v!);
        
        
        C.set(item: self, attri: .top, relatedBy: .equal, toItem: v!, attribute: .top, multiplier: 1.0, constant:0, viewMain:v!);
        
        
        self.layoutIfNeeded()
    
        //Made card holder with cards
        self.cardHolder = CardHolder()
        self.cardHolder.setUpScrollerOnTop(v:self)
    
        Animator.shared.bottomView = BottomView.init(v: v!, topV: self);
        

    }

    
}
