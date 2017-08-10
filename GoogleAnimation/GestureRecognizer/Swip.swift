//
//  Swip.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit





class Swip:NSObject{

    static let shared:Swip = Swip()
    
    var config:SwiperConfig!
    


    //MARK:- Create Swiper
    public func madeSwiperWithDirections(config:SwiperConfig?, view:UIView?){
        self.config = config
        
        if (view != nil){
            
            if (self.config  == nil){
                    self.config = SwiperConfig();
            }
            
        
            if (self.config.directions.count>0){
                    for direction  in self.config.directions {
                           _ = SwipeGesture.init(direction: direction, view: view!);
                    }
            }
        }
    
    }
    
  
    
    
    
    
    

    
    
    
    
    
    

}
