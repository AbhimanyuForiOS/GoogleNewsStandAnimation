//
//  SwipGesture.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit



class SwipeGesture:UISwipeGestureRecognizer{
    
   
    var cardTopConst:CGFloat     =  Animator.shared.config.top_Header_h!
    var cardLeadingConst:CGFloat =  SCREEN_WIDTH*0.15
    var cardHeightConst:CGFloat  = (SCREEN_HEIGHT-(Animator.shared.config.top_Header_h! + SCREEN_WIDTH*0.10))/CGFloat(Animator.shared.config.cards!.count)


    
    
    convenience init(direction:UISwipeGestureRecognizerDirection,view:UIView) {
        
        self.init()
    
       

        //initilization of each swipe
        self.addTarget(self, action:#selector(handleSwipe(gesture:)))
        self.direction = direction
        view.addGestureRecognizer(self);
    
    }
    

    //MARK:- swipe detector for all side left , right , top , bottom .....
    public func handleSwipe(gesture: UISwipeGestureRecognizer) {
        
        print(gesture.direction)
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.down:
            animateHeaderViewHeight(gesture: gesture);
            Animator.shared.config.animationTopBottomValue = -Animator.shared.config.animationaccerlation
            Animator.shared.config.animationleftRightValue = 0.0;
        
        case UISwipeGestureRecognizerDirection.up:
            animateHeaderViewHeight(gesture: gesture);
            Animator.shared.config.animationTopBottomValue = Animator.shared.config.animationaccerlation
               Animator.shared.config.animationleftRightValue = 0.0;
        case UISwipeGestureRecognizerDirection.left:
            print("left swipe")
            Animator.shared.config.animationTopBottomValue = 0.0
            Animator.shared.config.animationleftRightValue = -Animator.shared.config.animationaccerlation;
            animatescrollerleftRight(gesture: gesture)
        case UISwipeGestureRecognizerDirection.right:
            Animator.shared.config.animationTopBottomValue = 0.0
            Animator.shared.config.animationleftRightValue = Animator.shared.config.animationaccerlation;
            print("right swipe")
            animatescrollerleftRight(gesture: gesture)
        default:
            print("other swipe")
        }
        
        
        
  
        
    }
    
    
    func  animatescrollerleftRight(gesture: UISwipeGestureRecognizer){
     if (Animator.shared.config.headerStage == Stage.full_stage){
        return
        
        }
       
         if gesture.direction == UISwipeGestureRecognizerDirection.left{
            //going forward
            if Animator.shared.config.selectedIndex! < (Animator.shared.config.cards!.count-1){
                 Animator.shared.config.selectedIndex! += 1
            }
           
        
         }else if gesture.direction == UISwipeGestureRecognizerDirection.right {
            //coming back
            if Animator.shared.config.selectedIndex! > 0{
                Animator.shared.config.selectedIndex! -= 1
            }
        }
        
        print(Animator.shared.config.selectedIndex!)
        
        let x =  CGFloat(Animator.shared.config.selectedIndex!)*Animator.shared.topView!.bounds.size.width
        Animator.shared.topView.cardHolder.setContentOffset(CGPoint.init(x:x,y: 0), animated: true);
        Animator.shared.bottomView.tblHolder.setContentOffset(CGPoint.init(x:x,y: 0), animated: true);
        setSelectedCardIndex()
    }
    
    
    
    func setSelectedCardIndex(){
        for i in stride(from: 0, to:Animator.shared.config.cards!.count , by: 1){
            let card:Card = Animator.shared.config.cards![i];
            card.isSelected = false
            if i == Animator.shared.config.selectedIndex!{
                card.isSelected = true
                card.tblView.reloadData()
            }
        }

    
    }

    
    func animateHeaderViewHeight(gesture:UISwipeGestureRecognizer){
        
        UIView.animate(withDuration: TimeInterval(Animator.shared.config.animation_speed!), animations: {
            
            Animator.shared.config.topHeaderHeightConstraint!.constant = self.returnStage( gesture: gesture);
            Animator.shared.topView.layoutIfNeeded()
            Animator.shared.imgViewBg.layoutIfNeeded()
            Animator.shared.viewMain.layoutIfNeeded()
            
            self.playCardMovements(gesture: gesture);
            
        })
    
    }
    
    
    
    
    func returnStage(gesture: UISwipeGestureRecognizer)->CGFloat{
    
        //WHEN SLIDER TOP HEADER would in middle stage
        if (Animator.shared.config.headerH! == Animator.shared.config.mid_Header_h  ){
            
                    if gesture.direction == UISwipeGestureRecognizerDirection.up{
                        
                        Animator.shared.config.headerStage = Stage(rawValue: 0);
                        Animator.shared.config.headerH =   Animator.shared.config.top_Header_h!
                        
                        return Animator.shared.config.top_Header_h!
                    
                    }else{
                            Animator.shared.config.headerStage = Stage(rawValue: 2);
                            Animator.shared.config.headerH = Animator.shared.config.full_Header_h!
                        
                        return  Animator.shared.config.full_Header_h!

                    }
        }
        
        
        
        //TOP CASE...
        if (Animator.shared.config.headerH! == Animator.shared.config.top_Header_h  ){
            
                    if gesture.direction == UISwipeGestureRecognizerDirection.down{
                        Animator.shared.config.headerStage = Stage(rawValue: 1);
                        Animator.shared.config.headerH =  Animator.shared.config.mid_Header_h!

                        return  Animator.shared.config.mid_Header_h!
                    }
               return  Animator.shared.config.top_Header_h!;
        }
        
       
        
        //FULL CASE...
        if (Animator.shared.config.headerH! == Animator.shared.config.full_Header_h  ){
            
                    if gesture.direction == UISwipeGestureRecognizerDirection.up{
                        Animator.shared.config.headerStage = Stage(rawValue: 1);
                        Animator.shared.config.headerH =  Animator.shared.config.mid_Header_h!
                        return  Animator.shared.config.mid_Header_h!
                    }
             return  Animator.shared.config.full_Header_h!;
        }
        
        return  Animator.shared.config.mid_Header_h!;
    }
    
    
    
    //MARK:- Set up cards according to  top, mid, full conditions...
    
    func playCardMovements(gesture:UISwipeGestureRecognizer){
    
        
        if (Animator.shared.config.headerStage == Stage.full_stage){
                if gesture.direction == UISwipeGestureRecognizerDirection.down{
                    
                    var top = self.cardTopConst;
                    
                   
                                //animate cards top+leading and make them horizontal to vertical stage...
                                UIView.animate(withDuration: TimeInterval(Animator.shared.config.animation_speed!), animations: {
                                    
                                    for i in stride(from: 0, to: Animator.shared.config.cards!.count, by: 1){
                                        let card                =  Animator.shared.config.cards![i];
                                        card.height!.constant   = self.cardHeightConst;
                                        card.leading!.constant  = self.cardLeadingConst;
                                        card.top!.constant      =   top;
                                        card.layoutIfNeeded()
                                        
                                        card.line.centerX?.constant            = card.bounds.size.width*0.20;
                                        card.line.layoutIfNeeded()
                                        
                                      
                                        card.title.centerX?.constant            = -card.bounds.size.width*0.40;
                                        card.title.layoutIfNeeded()
                                        card.title.transform = CGAffineTransform(scaleX: 2.3, y: 2.3) //Scale label area
                                      
                                        
                                        
                                        top += self.cardHeightConst+SCREEN_WIDTH*0.014;
                                        

                                    }
                                       Animator.shared.viewMain.layoutIfNeeded()
                                       Animator.shared.topView.cardHolder.contentSize = CGSize.init(width: 0, height: 0);
                                })
                    
                }// gesture down condition cloesed
             // reloadTbls()
            return
        }
        
        
        //stage would be mid or top
        //animate cards top+leading and make them vertical  to horizontal stage where ther were Again..
        UIView.animate(withDuration: TimeInterval(Animator.shared.config.animation_speed!), animations: {
            
            
            var xLeading:CGFloat = 0.0
           
       
            var selectedIndex = 0;
            for i in stride(from: 0, to: Animator.shared.config.cards!.count, by: 1){
                let card  =  Animator.shared.config.cards![i];
                
            
            
                
                //in middle lines will come in center
                if (Animator.shared.config.headerStage == Stage.mid_stage){
                    
                    card.height!.constant =  Animator.shared.config.mid_Header_h!;
               
                    
                     card.line.centerX?.constant            = 0;
                     card.line.layoutIfNeeded()
                    
                    
                     card.title.centerX?.constant            = 0.0;
                     card.title.layoutIfNeeded()
                     card.title.transform = CGAffineTransform(scaleX: 1.8, y: 1.8) //Scale label area
        
                
                }else{
                    
                      card.height!.constant =  Animator.shared.config.top_Header_h!;
        
                     //card.line.centerX?.constant  =  ;
                     Animator.shared.topView.cardHolder.bringSubview(toFront:  card.line);
                     card.line.layoutIfNeeded()
                
                     card.title.centerX?.constant            = 0.0;
                     card.title.layoutIfNeeded()
                     card.title.transform = CGAffineTransform(scaleX: 1.0, y: 1.0) //Scale label area
              
                }
                
                
                card.leading!.constant = xLeading;
                card.top!.constant      = 0.0;
  
                if card.isSelected == true{
                    selectedIndex = i;
                  
                }
                card.layoutIfNeeded()
                
                
                xLeading +=  card.bounds.size.width
            }
            
            Animator.shared.viewMain.layoutIfNeeded()
            
            
            Animator.shared.topView.cardHolder.contentSize = CGSize.init(width: xLeading, height: 0);
            Animator.shared.topView.cardHolder.contentOffset = CGPoint(x: CGFloat(selectedIndex)*SCREEN_WIDTH, y: 0);
            
            
        })
        
        reloadTbls()
        
    }
    
    func reloadTbls(){
        let cardsCount =    Animator.shared.config.cards!.count
        
        
        if cardsCount > 0 {
        
            //draw on scroller ...
            for i in stride(from: 0, to: cardsCount, by: 1){
                //get each card and set up in scroller
                let c = Animator.shared.config.cards![i]
                 c.tblView.reloadData()
             
            }
        }
    
    
    }
    
    
    func ceterlize(isCenterlize:Bool){
    
        if isCenterlize{
            for i in stride(from: 0, to: Animator.shared.config.cards!.count, by: 1){
                let card  =  Animator.shared.config.cards![i];
                if card.isSelected!{
                
                    //draw all lines here and selected should be white else gray
                   // card.line.centerX?.constant  = i
                
                
                }
            
            }

        
        
        }else{
        //put them on orignal stage
        }
    
    }
    
 
    

}
