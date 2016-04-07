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


class SentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var cards = [tempCard]()
    let cardDataSource = CardDataSource()
    
    
    func gettingSentCardData() {
        
        let request = Alamofire.request(.GET, "http://rhubarb-sundae-21254.herokuapp.com/users/1/sent")
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
                    
                    let card = tempCard(id: id, to: to, from: from, greeting: greeting, message: message,
                                        occasion: occasion)
                    print("**********")
                    self.cards.append(card)
                    print(i)
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
        gettingSentCardData()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SendCardDetails" {
            if let destination = segue.destinationViewController as? SingleCardDetailsViewController {
                
                let path = tableView.indexPathForSelectedRow
                let cell = tableView.cellForRowAtIndexPath(path!)
                
//                navigationItem.title = card!.type?.capitalizedString
//                cell.imageView.image = UIImage(named: templateID.lowercaseString)
                destination.viaSegue = (cell?.textLabel?.text!)!
                print(destination)
                print(cell)
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _ = tableView.indexPathForSelectedRow!
        if let _ = tableView.cellForRowAtIndexPath(indexPath) {
            self.performSegueWithIdentifier("SendCardDetails", sender: self)
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

        let cell = tableView.dequeueReusableCellWithIdentifier("SentCell", forIndexPath: indexPath) as UITableViewCell
        let recipientName = cards[indexPath.row].to! as String
        
        cell.textLabel?.text = cards[indexPath.row].message
        cell.detailTextLabel?.text = "To: \(recipientName)"
        
        return cell
    }
    
    
} // End of Class
