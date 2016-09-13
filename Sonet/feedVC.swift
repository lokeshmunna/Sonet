//
//  feedVC.swift
//  Sonet
//
//  Created by Vinay Kumar Darna on 13/09/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class feedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(sender: AnyObject) {
      
    let removeSuccessful: Bool = KeychainWrapper.defaultKeychainWrapper().removeObjectForKey(KEY_UID)
        
        performSegueWithIdentifier("logout", sender: nil)
        
        print("Successfully remove the key Value to logout\(removeSuccessful)")
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
