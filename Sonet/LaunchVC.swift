//
//  ViewController.swift
//  Sonet
//
//  Created by Vinay Kumar Darna on 07/09/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

import UIKit

class LaunchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [self.navigationController?.setNavigationBarHidden(true, animated: true)]
        
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func loginPageBtn(sender: AnyObject) {
        
//      let loginView = self.storyboard?.instantiateViewControllerWithIdentifier("loginVCid") as? loginVC
//        
//        
//        self.navigationController?.pushViewController(loginView!, animated: true)
        
        
    }
    
    @IBAction func fbLogin(sender: AnyObject) {

        
        
    }


}

