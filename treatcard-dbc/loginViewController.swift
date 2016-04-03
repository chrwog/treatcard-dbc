//
//  loginViewController.swift
//  treatcard-dbc
//
//  Created by Baron Kwan on 4/2/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        
   //     let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
   //     let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
//        if(userEmailStored == userEmail) {
//            
//            if(userPasswordStored == userPassword) {
//                // Login successful
//                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn");
//                NSUserDefaults.standardUserDefaults().synchronize();
//                self.dismissViewControllerAnimated(true, completion: nil);
//            }
//        } else {
//            
//            displayMyAlertMessage("Email or Password incorrect! Please try again.");
//            
//        }
        
        print(userEmail)
        print(userPassword)
        
        
    }
    
    func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title: "Warning", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil);
        
        
        
        
    }

    
}