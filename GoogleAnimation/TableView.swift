//
//  TableView.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 09/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit

class TableView:UITableView,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    
    var items:[Model]? = [Model]()
    var isSelected:Bool?
    
  
    
    var top:NSLayoutConstraint?                 = NSLayoutConstraint()
    var leading:NSLayoutConstraint?             = NSLayoutConstraint()
    var bottom:NSLayoutConstraint?              = NSLayoutConstraint()
    var trailing:NSLayoutConstraint?            = NSLayoutConstraint()

    //MARK:- TableView Initializer
    convenience init(v:TableHolder!,xLeading:CGFloat) {
        
        self.init()
        
        self.backgroundColor =  .white//self.getRandomColor()//UIColor.init(red: 255.0/255.0, green: 0.0, blue: 0.0, alpha: 0.15);
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.delegate                                  = self
        self.dataSource                                = self
    
        self.separatorStyle                            = .none
        self.register(CellTable.self, forCellReuseIdentifier: "CellTable")
        
        v!.addSubview(self);
        
        
        C.set(item: self, attri: .leading, relatedBy: .equal, toItem: v!, attribute: .leading, multiplier: 1.0, constant: xLeading, viewMain: v!);
        C.set(item: self, attri: .width, relatedBy: .equal, toItem: v!, attribute: .width, multiplier: 1.0, constant: 0, viewMain: v!);
        C.set(item: self, attri: .height, relatedBy: .equal, toItem: v!, attribute: .height, multiplier: 1.0, constant: 0, viewMain: v!);
        C.set(item: self, attri: .top, relatedBy: .equal, toItem: v!, attribute: .top, multiplier: 1.0, constant: 0, viewMain: v!);
        self.layoutIfNeeded()
    
    }
    


    //MARK:- UITableView Delegate and DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell                            = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
        cell.backgroundColor = .lightGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let card:Card = Animator.shared.config.cards![Animator.shared.config.selectedIndex!] as Card;
        let item:Model = items![indexPath.row] as Model;
        Animator.shared.tableItem(item: item, card: card);
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREEN_WIDTH*0.10+SCREEN_WIDTH*0.40
    }
    
    
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
            let c = cell as! CellTable
        
        
        
            //give animantion from where we wanna start...
            let  transform = CATransform3DTranslate(CATransform3DIdentity, Animator.shared.config.animationleftRightValue, Animator.shared.config.animationTopBottomValue , 0);
            c.layer.transform = transform
        
            //get back in orignal stage
            UIView.animate(withDuration: TimeInterval( 0.2*Float(indexPath.row))) {
              //  c.alpha = 1;
                 c.layer.transform = CATransform3DIdentity
            }
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
        
        
    }
    
    
    


    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }

    
    
}
