//
//  SecondViewController.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/2/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit
import Alamofire

class SentViewController: UIViewController {
    @IBOutlet weak var sentCards: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, "http://rhubarb-sundae-21254.herokuapp.com/cards/sent")
            .responseJSON { response in
                let cardsSent = response.2.value!
                self.sentCards.text = String()
                var i = 0
                while i < cardsSent.count{
                    if let recipient = cardsSent[i]["recipient"] {
                        self.sentCards.text! += "\(recipient!) received:"
                        }
                     if let greeting = cardsSent[i]["greeting"] {
                        self.sentCards.text! += "Greeting:\(greeting!)"
                    }
                     if let message = cardsSent[i]["message"] {
                        self.sentCards.text! += "Message: \(message!) \n"
                    }
                    i += 1
                    }
//                var i = 0

        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//This is a change
//asdlfsdf
//This is wong work
//here is shahin change

//another change
//sanderfer was here