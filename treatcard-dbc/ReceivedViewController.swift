//
//  SecondViewController.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/2/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire



class ReceivedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var cards = [tempCard]()
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //How many rows in the table view?
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    //what are the contents of each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = cards[indexPath.row].message
        
        //        cell.textLabel?.text = "BARON"
        return cell
    }
    
    func gettingSentCardData() {
        
        let request = Alamofire.request(.GET, "https://rhubarb-sundae-21254.herokuapp.com/cards/sent")
        request.responseJSON{ (response) -> Void in
            if let value = response.2.value {
                let json = JSON(value)
                var i = 0
                while i < json.count {
                    let id = String(i)
                    let recipient = String(json[i]["recipient"])
                    let greeting = String(json[i]["greeting"])
                    let message = String(json[i]["message"])
                    let card = tempCard(id: id, recipient: recipient, greeting: greeting, message: message)
                    print("**********")
                    self.cards.append(card)
                    print("recipient: \(json[i]["recipient"].string!)")
                    print("greeting: \(json[i]["message"].string!)")
                    print("message: \(json[i]["greeting"].string!)")
                    self.tableView.reloadData()
                    i += 1
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        gettingSentCardData()
        
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