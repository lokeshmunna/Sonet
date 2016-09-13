//
//  loginVC.swift
//  Sonet
//
//  Created by Vinay Kumar Darna on 11/09/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

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
    

    @IBAction func emailSignBtn(sender: AnyObject) {
        
        if let email = emailFld.text, let pwd = pwdFld.text {
            
            
            FIRAuth.auth()?.signInWithEmail(email, password: pwd, completion: { (user, error) in
                if error == nil {
                    
                    let saveSuccessful = KeychainWrapper.defaultKeychainWrapper().setString((user?.uid)!, forKey: KEY_UID)
                    
                    print("User Authentication with firebase\(saveSuccessful)")
                    
                    self.performSegueWithIdentifier("feedVCfromEmail", sender: nil)
                    
                } else if error != nil {
                    
                    
                    let Signup = UIAlertController(title: "SIGN UP", message:"Your Email is unregisterd Click OK to SIGN UP", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    Signup.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
                    
                    self.presentViewController(Signup, animated: true, completion: nil)
                    
                    Signup.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: { (action) in
                        FIRAuth.auth()?.createUserWithEmail(email, password: pwd, completion: { (user, error) in
                            if error != nil {
                                
                                let errorInSignup = UIAlertController(title: "Alert", message: "\(error!.localizedDescription)", preferredStyle: UIAlertControllerStyle.Alert)
                                
                                errorInSignup.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                                
                                self.presentViewController(errorInSignup, animated: true, completion: nil)
                                
                                print("Hey Unable to authenticating Firebase with email\(error)")
                            } else {
                                
                                let Signup = UIAlertController(title: "Alert", message:"You succesfully registerd with your mailid please login", preferredStyle: UIAlertControllerStyle.Alert)
                                
                                Signup.addAction(UIAlertAction(title: "ok", style: .Default, handler: nil))
                                
                                self.presentViewController(Signup, animated: true, completion: nil)

                                print("Sucessfully Authenticating with new mailID")
                            }
                        })
                    }))
                    
                    
                    
                }
                    
                    
                else {
                    
                    let credential = FIREmailPasswordAuthProvider.credentialWithEmail(email, password: pwd)
                    [self.firebaseAuth(credential)]

                   
                }
            })
        }
        
    }
    
    
    func firebaseAuth (_credintials: FIRAuthCredential) {
        FIRAuth.auth()?.signInWithCredential(_credintials, completion: { (user, error) in
            if error != nil {
                
                print("Unable to Authenticating the firebase - \(error)")

                
                let errorInSignin = UIAlertController(title: "Alert", message: "\(error!.localizedDescription)", preferredStyle: UIAlertControllerStyle.Alert)
                
                errorInSignin.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                
                self.presentViewController(errorInSignin, animated: true, completion: nil)
                
                
                
            } else {
                
                let saveSuccessful = KeychainWrapper.defaultKeychainWrapper().setString((user?.uid)!, forKey: KEY_UID)
                
                print("Sucessfully Authenticating the firebase\(saveSuccessful)")
            }
            
            
        })
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
