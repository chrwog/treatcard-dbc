//
//  loginViewController.swift
//  treatcard-dbc
//
//  Created by Baron Kwan on 4/2/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit
import Alamofire

class loginViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    internal var tester: String!

    
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
        print(userPassword!)
        postData("http://localhost:3000/sessions", email: userEmail!, password: userPassword!)
        // ALAMO FIRE HERE!!
        
//        let parameters = ["email":userEmail!,"password":userPassword!]
//        Alamofire.request(.POST, "http://localhost:3000/sessions", parameters: parameters)
//            .responseJSON { _, _, result in
//                //let x = NSJSONSerialization.dataWithJSONObject(result, options: nil)
//                print(result)
//                //debugPrint(x["authorization"])
//                debugPrint(result)
//        }

        
        
        
        
// ----------------
        
        //Do my login here...
        //If login successful:
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let appDelegate: UIApplicationDelegate = UIApplication.sharedApplication().delegate! as UIApplicationDelegate
        self.dismissViewControllerAnimated(true, completion: nil)
        appDelegate.window?!.rootViewController = storyboard.instantiateViewControllerWithIdentifier("mainTabBarController") as UIViewController
        
        
        
// ----------------
        
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
        
      //  print(userEmail)
      //  print(userPassword)
        
        
    }
    
    func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title: "Warning", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil);
        
        
        
        
    }
    
    func postData(hostUrl: String, email: String, password: String){
        
        let url = NSURL(string: hostUrl+"?"+"email="+email+"&password="+password)
        let request: NSMutableURLRequest =
            NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        request.timeoutInterval = 60.0
        //additional headers
        // request.setValue("deviceIDValue", forHTTPHeaderField:"DeviceId")
        
//        let bodyStr = "email="+email+"&password="+password
//        let bodyData = bodyStr.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
//        request.HTTPBody = bodyData
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request){
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            if let httpResponse = response as? NSHTTPURLResponse {
                print("responseCode \(httpResponse.statusCode)")
            }
            
            if error != nil {
                
                // You can handle error response here
                print("\(error)")
            }else {
                //Converting response to collection formate (array or dictionary)
                do{
                    let jsonResult: AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    
                   // print(jsonResult)
                    let phone = jsonResult["phone"] as! String
                    let username = jsonResult["username"] as! String
                    let userId = jsonResult["id"] as! Int
                    let currentUser = User(id: userId, username: username, email: email, phone: phone)
                    print("currentUser")
                    print(currentUser)
                    var userDefaults = NSUserDefaults.standardUserDefaults()
                    let encodedData = NSKeyedArchiver.archivedDataWithRootObject(currentUser)
                    userDefaults.setObject(encodedData, forKey: "currentUser")
                    userDefaults.setObject(password, forKey: "currentUserPassword" )
                    userDefaults.synchronize()
                    
                    
//                    NSUserDefaults.standardUserDefaults().setObject(currentUser, forKey: "currentUser");
//                    NSUserDefaults.standardUserDefaults().setObject(password, forKey: "currentUserPassword");
                    //debugPrint(jsonResult)
                    //success code
                    
                }catch{
                    //failure code
                        print("failure code")
                }
            }
        }
        
        task.resume()
        
    }

    
    

    
}