////
////  SecondViewController.swift
////  treatcard-dbc
////
////  Created by Chris Wong on 4/2/16.
////  Copyright © 2016 treatcard. All rights reserved.
////
//
//import UIKit
//import SwiftyJSON
//import Alamofire
//
//
//
//class ReceivedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {
//    
//    
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var searchBar: UISearchBar!
//    
//    var cards = [UserCard]()
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    //How many rows in the table view?
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cards.count
//    }
//    
//    //what are the contents of each cell
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
////        let cell = UITableViewCell()
//        let cell = tableView.dequeueReusableCellWithIdentifier("ReceivedCell", forIndexPath: indexPath) as UITableViewCell
//        cell.textLabel?.text = cards[indexPath.row].message
//        let sendName = cards[indexPath.row].from! as String
//        cell.detailTextLabel?.text = "From: \(sendName)"
//        
//        //        cell.textLabel?.text = "BARON"
//        return cell
//    }
//    
//    func gettingReceivedCardData() {
//        
//        let request = Alamofire.request(.GET, "http://rhubarb-sundae-21254.herokuapp.com/users/1/sent")
////        let request = Alamofire.request(.GET, "http://rhubarb-sundae-21254.herokuapp.com/users/1/received")
//        request.responseJSON{ (response) -> Void in
//            if let value = response.2.value {
//                let json = JSON(value)
//                var i = 0
//                while i < json.count {
//                    let id = String(i)
//                    let to = String(json[i]["to"])
//                    let from = String(json[i]["from"])
//                    let greeting = String(json[i]["greeting"])
//                    let message = String(json[i]["message"])
//                    let occasion = String(json[i]["occasion"])
//                    
//                    let card = UserCard(id: id, to: to, from: from, greeting: greeting, message: message,
//                        occasion: occasion)
//                    print("**********")
//                    self.cards.append(card)
//                    print("Card: #\(i)")
//                    print("to: \(json[i]["to"].string!)")
//                    print("from: \(json[i]["from"].string!)")
//                    print("greeting: \(json[i]["greeting"].string!)")
//                    print("message: \(json[i]["message"].string!)")
//                    print("occasion: \(json[i]["occasion"].string!)")
//                    self.tableView.reloadData()
//                    i += 1
//                }
//            }
//        }
//    }
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        self.searchBar.delegate = self
//        gettingReceivedCardData()
//        
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    
//}
//
////This is a change
////asdlfsdf
////This is wong work
////here is shahin change
//
////another change
////sanderfer was here
//

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


class ReceivedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var card: Card?
    
    var cards = [UserCard]()
    
    let cardDataSource = CardDataSource()
    
    
    func gettingReceivedCardData() {
        
        let request = Alamofire.request(.GET, "http://rhubarb-sundae-21254.herokuapp.com/users/1/received")
        request.responseJSON{ (response) -> Void in
            if let value = response.2.value {
                let json = JSON(value)
                var i = 0
                while i < json.count {
                    let id = String(i)
                    let to = String(json[i]["to"])
                    let from = String(json[i]["from"])
                    let greeting = String(json[i]["greeting"])
                    let message = String(json[i]["message"])
                    let occasion = String(json[i]["occasion"])
                    
                    let card = UserCard(id: id, to: to, from: from, greeting: greeting, message: message,
                        occasion: occasion)
                    print("**********")
                    self.cards.append(card)
                    print("Card: #\(i)")
                    print("to: \(json[i]["to"].string!)")
                    print("from: \(json[i]["from"].string!)")
                    print("greeting: \(json[i]["greeting"].string!)")
                    print("message: \(json[i]["message"].string!)")
                    print("occasion: \(json[i]["occasion"].string!)")
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
        self.searchBar.delegate = self
        gettingReceivedCardData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ReceivedCardDetails" {
            if let dvc = segue.destinationViewController as? ReceivedMessageViewController {
                
                let path = tableView.indexPathForSelectedRow
                let cell = tableView.cellForRowAtIndexPath(path!)
                
                //                navigationItem.title = card!.type?.capitalizedString
                //                cell.imageView.image = UIImage(named: templateID.lowercaseString)
                
                
                // Data from rails? Or data from Sender
                let card = Card(id: "1", name: "hey", templateID: "1")
//                var cards = self.cards
                dvc.card = card
                
                dvc.navigationItem.title? = (card.name?.capitalizedString)!
                dvc.receivedCardView?.image? = UIImage(named: card.templateID!.lowercaseString)!
                print(cell)
                dvc.labeltext2 = "From: David"
                dvc.labeltext1 = "To: JP"
                dvc.labeltext3 = "Get Well Soon"
                
                //                dvc.labeltext1.text = cards[indexPath.row].message
                //                dvc.labeltext2.text = "To: \(recipientName)"
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _ = tableView.indexPathForSelectedRow!
        if let _ = tableView.cellForRowAtIndexPath(indexPath) {
            self.performSegueWithIdentifier("ReceivedCardDetails", sender: self)
        }
        
    }
    
    
    // Set only one Column on the tableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of rows in the table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    // Contents of each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ReceivedCell", forIndexPath: indexPath) as UITableViewCell
        let recipientName = cards[indexPath.row].to! as String
        
        cell.textLabel?.text = cards[indexPath.row].message
        cell.detailTextLabel?.text = "To: \(recipientName)"
        
        return cell
    }
    
    
} // End of Class
