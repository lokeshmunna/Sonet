//
//  feedVC.swift
//  Sonet
//
//  Created by Vinay Kumar Darna on 13/09/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class feedVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            if self.revealViewController() != nil {
            open.target = self.revealViewController()
            open.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

       
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: AnyObject) {
      
    let removeSuccessful: Bool = KeychainWrapper.defaultKeychainWrapper().removeObjectForKey(KEY_UID)
        
        performSegue(withIdentifier: "logout", sender: nil)
        
        print("Successfully remove the key Value to logout\(removeSuccessful)")
        
    }

    @IBOutlet var open: UIBarButtonItem!
    @IBAction func open(_ sender: AnyObject) {
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell") as! feedCell
        
        
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
