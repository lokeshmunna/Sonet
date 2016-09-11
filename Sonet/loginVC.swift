//
//  loginVC.swift
//  Sonet
//
//  Created by Vinay Kumar Darna on 11/09/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

import UIKit

class loginVC: UIViewController {

    @IBOutlet var emailFld: FloatLabelTextField!
    @IBOutlet var pwdFld: FloatLabelTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let border = CALayer()
        let borderWidth: CGFloat = 1
        border.frame = CGRectMake(0, emailFld.frame.size.height - borderWidth, emailFld.frame.size.width, emailFld.frame.size.height)
        border.borderColor = UIColor.yellowColor().CGColor
        border.borderWidth = borderWidth
        emailFld.layer.addSublayer(border)
        emailFld.layer.masksToBounds = true
 
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
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
