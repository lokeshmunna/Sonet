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
        let borderWidth: CGFloat = 6
        border.frame = CGRect(x: 0, y: emailFld.frame.size.height - borderWidth, width: emailFld.frame.size.width, height: emailFld.frame.size.height)
        border.borderColor = UIColor.yellow.cgColor
        border.borderWidth = borderWidth
        emailFld.layer.addSublayer(border)
        emailFld.layer.masksToBounds = true
 
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func emailSignBtn(_ sender: AnyObject) {
        
        if let email = emailFld.text, let pwd = pwdFld.text {
            
            
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    
                   let saveSuccessful = KeychainWrapper.defaultKeychainWrapper().setString((user?.uid)!, forKey: KEY_UID)
                    
                    print("User Authentication with firebase\(saveSuccessful)")
                    
                    self.performSegue(withIdentifier: "feedVCfromEmail", sender: nil)
                    
                }
                else if error != nil {
                    
                    let Signup = UIAlertController(title: "Alert", message:"\(error!.localizedDescription)", preferredStyle: UIAlertControllerStyle.alert)
                    
                    Signup.addAction(UIAlertAction(title: "Correct password", style: .default, handler: nil))
                    
                    self.present(Signup, animated: true, completion: nil)
                    
                    Signup.addAction(UIAlertAction(title: "Sign Up", style: .cancel, handler: { (action) in
                        FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                            if error != nil {
                                
                                let errorInSignup = UIAlertController(title: "Alert", message: "\(error!.localizedDescription)and please check your password", preferredStyle: UIAlertControllerStyle.alert)
                                
                                errorInSignup.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                
                                self.present(errorInSignup, animated: true, completion: nil)
                                
                                print("Hey Unable to authenticating Firebase with email\(error)")
                            } else {
                                
                                let Signup = UIAlertController(title: "Alert", message:"You succesfully registerd with your mailid please login", preferredStyle: UIAlertControllerStyle.alert)
                                
                                Signup.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                                
                                self.present(Signup, animated: true, completion: nil)

                                print("Sucessfully Authenticating with new mailID")
                            }
                        })
                    }))
                    
                    
                    
                }
                    
                    
                else {
                    
                    let credential = FIREmailPasswordAuthProvider.credential(withEmail: email, password: pwd)
                    self.firebaseAuth(credential)

                   
                }
            })
        }
        
    }
    
    
    func firebaseAuth (_ _credintials: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: _credintials, completion: { (user, error) in
            if error != nil {
                
                print("Unable to Authenticating the firebase - \(error)")

                
                let errorInSignin = UIAlertController(title: "Alert", message: "\(error!.localizedDescription)", preferredStyle: UIAlertControllerStyle.alert)
                
                errorInSignin.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                self.present(errorInSignin, animated: true, completion: nil)
                
                
                
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
