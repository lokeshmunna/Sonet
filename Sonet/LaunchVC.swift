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
import SwiftKeychainWrapper


class LaunchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [self.navigationController?.setNavigationBarHidden(true, animated: true)]
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        if let _ = KeychainWrapper.defaultKeychainWrapper().stringForKey(KEY_UID) {
            performSegueWithIdentifier("feedVCfromFB", sender: nil)
        }
    }

   
    @IBAction func loginPageBtn(sender: AnyObject) {
        
        performSegueWithIdentifier("loginVC", sender: nil)
        
        
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
                
 let saveSuccessful = KeychainWrapper.defaultKeychainWrapper().setString((user?.uid)!, forKey: KEY_UID)
                
                print("Sucessfully Authenticating the firebase with id\(saveSuccessful)")
            }
            
            
        })
    }

}

