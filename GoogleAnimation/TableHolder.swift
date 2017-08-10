//
//  TableHolder.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 09/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//


import Foundation
import UIKit
class TableHolder:UIScrollView,UIScrollViewDelegate{
    
    
    
    
    //MARK:-  it will draw all cards with scroller on "topView"
    public func  setUpScrollerOnTop(v:BottomView!){
        
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.delegate = self
        self.backgroundColor = .black;
        
        //scroller on topView
        v.addSubview(self)
        
        //set up constraints of scroller..
        C.set(item: self, attri: .leading, relatedBy: .equal, toItem: v, attribute: .leading, multiplier: 1.0, constant: 0, viewMain: v);
        
        C.set(item: self, attri: .bottom, relatedBy: .equal, toItem: v, attribute: .bottom, multiplier: 1.0, constant: 0, viewMain: v);
        
        C.set(item: self, attri: .trailing, relatedBy: .equal, toItem:   v, attribute: .trailing, multiplier: 1.0, constant: 0, viewMain: v);
        
        C.set(item: self, attri: .top, relatedBy: .equal, toItem:v , attribute: .top, multiplier: 1.0, constant:v!.header.bounds.size.height+SCREEN_WIDTH*0.03, viewMain:v);
        
        self.layoutIfNeeded()
        
        
        //DRAW Tables...
        self.setUpTbles(self)
        
    }
    
    func setUpTbles(_ v:UIScrollView){
        
        let cardsCount =    Animator.shared.config.cards!.count
        
        
            if cardsCount > 0 {
                var xLeading:CGFloat = 0.0
                //draw on scroller ...
                    for i in stride(from: 0, to: cardsCount, by: 1){
                            //get each card and set up in scroller
                            let c = Animator.shared.config.cards![i]
                            c.tblView! = TableView.init(v: self,xLeading:xLeading);
                            c.tblView.items = c.items
                            c.tblView.reloadData()
                            xLeading +=  v.bounds.size.width
            }
            
            v.isScrollEnabled = false
            v.backgroundColor = .clear
            v.isPagingEnabled = true
            v.showsHorizontalScrollIndicator = false;
            v.contentSize = CGSize.init(width: xLeading, height: 0);
            v.setContentOffset(CGPoint.init(x:0,y: 0), animated: true);
            
            
        }
        
        self.layoutIfNeeded()
        
    }
    
        
}
