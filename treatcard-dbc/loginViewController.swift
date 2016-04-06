//
//  loginViewController.swift
//  treatcard-dbc
//
//  Created by Baron Kwan on 4/2/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class loginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Coline - facebook login button
        if (FBSDKAccessToken.currentAccessToken() == nil) {
            print("Not logged in..")
        } else {
            print("Logged in..")
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        
//             let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
//             let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        let userEmailStored = "xxx"
        let userPasswordStored = "xxx"
                if(userEmailStored == userEmail) {
        
                    if(userPasswordStored == userPassword) {
                        // Login successful
                        
                        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn");
                        NSUserDefaults.standardUserDefaults().synchronize();
//                        self.dismissViewControllerAnimated(true, completion: nil);
                        self.performSegueWithIdentifier("loginToCatergories", sender: self)
                    }
                } else {
        
                    displayMyAlertMessage("Email or Password incorrect! Please try again.");
        
                }
        
        print(userEmail)
        print(userPassword)
        
        
    }
    
    func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title: "Warning", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil);
        
        
        
        
    }
    //Coline - facebook login
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            print("Login complete..")
            self.performSegueWithIdentifier("Tab Bar", sender: self)
        } else {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User logged out..")
    }
    
}