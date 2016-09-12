//
//  ViewController.swift
//  Sonet
//
//  Created by Vinay Kumar Darna on 07/09/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

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

        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (result, error) in
            if error != nil {
                
                print("Hey problem to Authenticating the facebook\(error)")
                
            }else if result.isCancelled == true {
                
               print("Hey it seems You cancelled to Authenticating the facebook")
            }else {
                
                print("Secussfully Authenticatimg the facebook")
               
                let credintials = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                
                [self.firebaseAuth(credintials)]
                
            }
        }
        
        
        
        
    }

    func firebaseAuth (_credintials: FIRAuthCredential) {
        FIRAuth.auth()?.signInWithCredential(_credintials, completion: { (user, error) in
            if error != nil {
                
                print("Unable to Authenticating the firebase - \(error)")
                
            } else {
                
                print("Sucessfully Authenticating the firebase")
            }
            
            
        })
    }

}

