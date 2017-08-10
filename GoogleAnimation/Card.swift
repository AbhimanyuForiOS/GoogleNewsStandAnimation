//
//  Cards.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit
class Card:UIImageView{
    
    
    var bgImage:String? = ""

    var isSelected:Bool?
    
    var title:Title = Title()
    var strTitle:String?
    var line:Line = Line()
    
    var tblView:TableView! = TableView()
    var items:[Model] = [Model]()
    
    
    var top:NSLayoutConstraint? = NSLayoutConstraint()
    var leading:NSLayoutConstraint? = NSLayoutConstraint()
    var height:NSLayoutConstraint? = NSLayoutConstraint()
    var width:NSLayoutConstraint? = NSLayoutConstraint()
    
    lazy  var constraits:[NSLayoutConstraint]?  = [NSLayoutConstraint]()
    
    convenience init(bgImage:String? = "0.png",strTitle:String? = "SCIENCE" ,items:[Model] =   [Model(),Model()]) {
        
        self.init()
        self.isUserInteractionEnabled = true
        self.bgImage        = bgImage
        self.strTitle = strTitle;
        self.image = UIImage.init(named: bgImage!);
        self.items = items;
     
    }
  
    
    
    
   
}


