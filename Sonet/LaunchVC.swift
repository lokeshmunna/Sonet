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
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if let _ = KeychainWrapper.defaultKeychainWrapper().stringForKey(KEY_UID) {
            performSegue(withIdentifier: "feedVCfromFB", sender: nil)
        }
    }

   
    @IBAction func loginPageBtn(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "loginVC", sender: nil)
        
        
    }
    
    @IBAction func fbLogin(_ sender: AnyObject) {

        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                
                print("Hey problem to Authenticating the facebook\(error)")
                
            }else if result?.isCancelled == true {
                
               print("Hey it seems You cancelled to Authenticating the facebook")
            }else {
                
                print("Secussfully Authenticatimg the facebook")
               
                let credintials = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                self.firebaseAuth(credintials)
                
                
            }
        }
        
        
        
        
    }

    func firebaseAuth (_ _credintials: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: _credintials, completion: { (user, error) in
            if error != nil {
                
                print("Unable to Authenticating the firebase - \(error)")
                
            } else {
                
 let saveSuccessful = KeychainWrapper.defaultKeychainWrapper().setString((user?.uid)!, forKey: KEY_UID)
                
                print("Sucessfully Authenticating the firebase with id\(saveSuccessful)")
            }
            
            
        })
    }

}

