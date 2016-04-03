//
//  RegisterViewController.swift
//  treatcard-dbc
//
//  Created by Baron Kwan on 4/2/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userRepeatPasswordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = userRepeatPasswordTextField.text;
        
        // Check for empty fields
        if(userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty) {
            
            // Display alert message
            displayMyAlertMessage("All fields are required");
            return;
        }
        
        // Check if passwords match
        
        if(userPassword != userRepeatPassword) {
            // Display alert message
            displayMyAlertMessage("Passwords do not match");
            return;
        }
        
        //        // Store data
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        
        // Display alert message with confirmation
        let myAlert = UIAlertController(title: "Alert", message: "Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) { action in
            self.dismissViewControllerAnimated(true, completion: nil);
        }
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil);
        
        
        
        // Send User data to server side
        
        //        let myUrl = NSURL(string: "https://herokuapp.com/users/")
        //        let request = NSMutableURLRequest(URL: myUrl!)
        //        request.HTTPMethod = "POST"
        //
        //        let postString = "email=\(userEmail)&password=\(userPassword)"
        //        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
    }
    
    
    func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil);
        
        
        
        
    }
    
    
}