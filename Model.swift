//
//  Model.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 09/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
class Model:NSObject{

    var title:String?
    var icon:String?
  
    
    init(title:String? = "",icon:String? = "0.png") {
        self.title = title
          self.icon = icon
    }
    
    

}
