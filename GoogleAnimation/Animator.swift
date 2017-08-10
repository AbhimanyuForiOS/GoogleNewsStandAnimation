//
//  Main.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit

protocol AnimatorCardDelegate{

    func  cardClickedFromTopHeader(card:Card)

}
protocol AnimatorTableDelegate {
    func  didSelect(item:Model,inCard card:Card)
}

class Animator:NSObject{

    
     var delegateCard:AnimatorCardDelegate! = nil
     var delegateTable:AnimatorTableDelegate! = nil
    
    lazy var config:AnimationConfig = AnimationConfig()

    
    static var shared:Animator = Animator()
    
    
    var imgViewBg:UIImageView! = UIImageView()
   
    var topView:TopView!
    
    var bottomView:BottomView!

    var viewMain:UIView!

    public  func setAnimator(_ backgroundImage:UIImage? = UIImage(),_ v:UIView? = UIView(),_ config:AnimationConfig? = AnimationConfig()) {
   
        self.config = config!
        
        if self.config.cards!.count > 6{
            print("Please set only 6 or less cards!!! ");
            return
        }
    
        viewMain = v;
    
        imgViewBg.image = backgroundImage
        imgViewBg.isUserInteractionEnabled = true
        imgViewBg.backgroundColor = .red;
        imgViewBg.translatesAutoresizingMaskIntoConstraints = false
        
        v!.addSubview(imgViewBg);
    
        
        C.set(item: imgViewBg, attri: .width, relatedBy: .equal, toItem: v!, attribute: .width, multiplier: 1.0, constant: 0, viewMain: v!);
        
        C.set(item: imgViewBg, attri: .height, relatedBy: .equal, toItem: v!, attribute: .height, multiplier: 1.0, constant: 0, viewMain: v!);
        
        C.set(item: imgViewBg, attri: .centerX, relatedBy: .equal, toItem: v!, attribute: .centerX, multiplier: 1.0, constant: 0, viewMain: v!);
        
        C.set(item: imgViewBg, attri: .centerY, relatedBy: .equal, toItem: v!, attribute: .centerY, multiplier: 1.0, constant:0, viewMain:v!);
        
        imgViewBg.layoutIfNeeded()
        
        topView = TopView.init(v: imgViewBg);
        

        //add swiper with directions .....
        Swip.shared.madeSwiperWithDirections(config: SwiperConfig(), view: imgViewBg);
  
    }
    
    
    func cardSelected(card:Card){
    
        if self.delegateCard != nil {
            self.delegateCard.cardClickedFromTopHeader(card: card);
        
        }
    }
    
    func tableItem(item:Model,card:Card){
        if self.delegateTable != nil {
            self.delegateTable.didSelect(item: item, inCard: card);
            
        }
    }
    
    
//   static func destroy(){
//    
//    if self.shared != nil{
//        self.shared = nil
//    }
//    }
//    
    
    
    
    
    

}

