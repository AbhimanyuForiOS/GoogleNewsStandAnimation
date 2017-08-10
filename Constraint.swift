//
//  Constraint.swift
//  KSFormGenerator
//
//  Created by Abhimanyu  on 01/04/17.
//  Copyright © 2017 Konstant. All rights reserved.


import Foundation
import UIKit

public struct C{
    
    //set any constraint
    static func  set(item:AnyObject,
                     attri:NSLayoutAttribute,
                     relatedBy: NSLayoutRelation = .equal,
                     toItem:AnyObject? = nil,
                     attribute:NSLayoutAttribute = .notAnAttribute,
                     multiplier:CGFloat = 1,
                     constant:CGFloat = 0,
                     viewMain:AnyObject){
        
        
        let any:NSLayoutConstraint = NSLayoutConstraint.init(item: item, attribute: attri, relatedBy: relatedBy, toItem: toItem, attribute: attribute, multiplier: multiplier, constant: constant)
        
        viewMain.addConstraint(any)
    }
    

    //get any  constraint
    static func  get(item:AnyObject,
                     attri:NSLayoutAttribute,
                     relatedBy: NSLayoutRelation = .equal,
                     toItem:AnyObject? = nil,
                     attribute:NSLayoutAttribute = .notAnAttribute,
                     multiplier:CGFloat = 1,
                     constant:CGFloat = 0,
                     viewMain:AnyObject)->NSLayoutConstraint{
        
        
        let any:NSLayoutConstraint = NSLayoutConstraint.init(item: item, attribute: attri, relatedBy: relatedBy, toItem: toItem, attribute: attribute, multiplier: multiplier, constant: constant)
        viewMain.addConstraint(any)
        
        return any
    }
    
    

    
}
