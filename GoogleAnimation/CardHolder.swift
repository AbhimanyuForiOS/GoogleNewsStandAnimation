//
//  CardHolder.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit
class CardHolder:UIScrollView,UIScrollViewDelegate{

    
    //MARK:-  it will draw all cards with scroller on "topView"
    public func  setUpScrollerOnTop(v:UIView){
     
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.delegate = self
        self.backgroundColor = .black;
      
     
        
        //scroller on topView
        v.addSubview(self)
        
        //set up constraints of scroller..
        C.set(item: self, attri: .leading, relatedBy: .equal, toItem: v, attribute: .leading, multiplier: 1.0, constant: 0, viewMain:  Animator.shared.viewMain);
        
        C.set(item: self, attri: .bottom, relatedBy: .equal, toItem:  v, attribute: .bottom, multiplier: 1.0, constant: 0, viewMain: Animator.shared.viewMain);
        
        C.set(item: self, attri: .trailing, relatedBy: .equal, toItem:  v, attribute: .trailing, multiplier: 1.0, constant: 0, viewMain: Animator.shared.viewMain);
        
        C.set(item: self, attri: .top, relatedBy: .equal, toItem: v, attribute: .top, multiplier: 1.0, constant:0, viewMain:Animator.shared.viewMain);
        
        self.layoutIfNeeded()
        
        
        //DRAW CARDS...
        self.setUpCards(self)
 
    
    
    }
    
    //MARK:- Set up your cards on scroller..
    func setUpCards(_ v:UIScrollView){
        
     let cardsCount =    Animator.shared.config.cards!.count
        
        if cardsCount > 0 {
            
            var xLeading:CGFloat = 0.0
            //draw on scroller ...
            for i in stride(from: 0, to: cardsCount, by: 1){
                
                
                //get each card and set up in scroller
                let c = Animator.shared.config.cards![i]
                c.translatesAutoresizingMaskIntoConstraints = false;
                self.addSubview(c);
                
                var h:CGFloat = 0.0
                if Animator.shared.config.headerStage!  == Stage(rawValue: 0)!{
                    h = Animator.shared.config.top_Header_h!
                
                }else  if Animator.shared.config.headerStage!  == Stage(rawValue: 1)!{
                      h = Animator.shared.config.mid_Header_h!
                }else{
                       h = Animator.shared.config.full_Header_h!
                }
                
                
                c.top       = C.get(item: c, attri: .top, relatedBy: .equal, toItem: v, attribute: .top, multiplier: 1.0, constant: 0, viewMain: v);
                c.height    = C.get(item: c, attri: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: h, viewMain: v);
                c.width     = C.get(item: c, attri: .width, relatedBy: .equal, toItem: v, attribute: .width, multiplier: 1.0, constant: 0, viewMain:v);
                c.leading   = C.get(item: c, attri: .leading, relatedBy: .equal, toItem: v, attribute: .leading, multiplier: 1.0, constant: xLeading, viewMain: v);
                v.addConstraints([c.top!,c.height!,c.width!,c.leading!]);
                c.layoutIfNeeded()
                
                
        
                c.line.translatesAutoresizingMaskIntoConstraints = false;
                c.line.backgroundColor = .white
                c.addSubview(c.line);
                
                //set line there
                
                c.line.centerY       = C.get(item: c.line, attri: .bottom, relatedBy: .equal, toItem: c, attribute: .bottom, multiplier: 0.7, constant: 0, viewMain: v);
                
                c.line.height    = C.get(item: c.line, attri: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Animator.shared.config.line_height!, viewMain: v);
                
                c.line.width     = C.get(item: c.line, attri: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,constant: Animator.shared.config.line_width!, viewMain:v);
                
                c.line.centerX   = C.get(item: c.line, attri: .centerX, relatedBy: .equal, toItem: c, attribute: .centerX, multiplier: 1.0, constant: 0.0, viewMain: v);
                v.addConstraints([c.line.centerY!,c.line.height!,c.line.width!,c.line.centerX!]);
                c.line.layoutIfNeeded()
                
            
                
                c.title  = Title.init(colorBg:  Animator.shared.config.lineBgSelectedColor)
                c.title.translatesAutoresizingMaskIntoConstraints = false;
                c.title.backgroundColor = .clear
                c.title.text = c.strTitle
                c.title.textColor = .white
                c.title.font      = UIFont.boldSystemFont(ofSize: c.bounds.size.height*0.043)
                c.title.textAlignment = .center
                self.addSubview(c.title);
                
    
                c.title.centerY       = C.get(item: c.title, attri: .bottom, relatedBy: .equal, toItem: c.line, attribute: .top, multiplier: 1.0, constant: -1, viewMain: v);
                
                c.title.height    = C.get(item: c.title, attri: .height, relatedBy: .equal, toItem: c, attribute: .height, multiplier: 0.25, constant: 0.0, viewMain: v);
                
                c.title.width     = C.get(item: c.title, attri: .width, relatedBy: .equal, toItem: c, attribute: .width, multiplier: 0.50,constant: Animator.shared.config.line_width!, viewMain:v);
                
                c.title.centerX   = C.get(item: c.title, attri: .centerX, relatedBy: .equal, toItem: c, attribute: .centerX, multiplier: 1.0, constant: 0.0, viewMain: v);
                v.addConstraints([c.title.centerY!,c.title.height!,c.title.width!,c.title.centerX!]);
                c.title.layoutIfNeeded()

                
                c.title.transform = CGAffineTransform(scaleX: 1.8, y: 1.8) //Scale label area
                print(xLeading)
                
                //set up buttons 
                let btn  =  UIButton(type: .custom)
                btn.translatesAutoresizingMaskIntoConstraints = false
                btn.backgroundColor = .clear
                btn.addTarget(self, action: #selector(self.btnActionTaped(btn:)), for: .touchUpInside)
                btn.tag = i
                c.addSubview(btn)
                
                
                C.set(item: btn, attri: .top, relatedBy: .equal, toItem: c, attribute: .top, multiplier: 1.0, constant: 0, viewMain: c);
                C.set(item: btn, attri: .bottom, relatedBy: .equal, toItem: c, attribute: .bottom, multiplier: 1.0, constant: 0, viewMain: c);
                C.set(item: btn, attri: .leading, relatedBy: .equal, toItem: c, attribute: .leading, multiplier: 1.0, constant: 0, viewMain: c);
                C.set(item: btn, attri: .trailing, relatedBy: .equal, toItem: c, attribute: .trailing, multiplier: 1.0, constant: 0, viewMain: c);
                btn.layoutIfNeeded()
                
                
                
                
                
                
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
    
    
    func btnActionTaped(btn:UIButton){
            print("btnActionTaped");
        
        
        
        let card:Card = Animator.shared.config.cards![btn.tag] as Card;
        Animator.shared.cardSelected(card: card);
        
        
    
    }
    
    
    
    //MARK:- Scroll View delegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.x/SCREEN_WIDTH)
        
        
        for i in stride(from: 0, to:Animator.shared.config.cards!.count , by: 1){
            let card:Card = Animator.shared.config.cards![i];
            card.isSelected = false
            if i == Int(scrollView.contentOffset.x/SCREEN_WIDTH){
             card.isSelected = true
            }
        }

    }
    
    
    
    
    

}

