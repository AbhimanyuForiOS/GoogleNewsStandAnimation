//
//  DetailVc.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 10/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import UIKit

class DetailVc: UIViewController {

    var titleString:String? = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setNav()
            self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    
    func setNav(){
        
        self.edgesForExtendedLayout = []
        self.automaticallyAdjustsScrollViewInsets = false;
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = titleString!
    
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
