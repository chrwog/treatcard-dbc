//
//  SingleCardDetailsViewController.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/3/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit


class ReceivedMessageViewController: UIViewController {
    
    var card: Card?
    
    var cards = [UserCard]()
    var labeltext1 = String()
    var labeltext2 = String()
    var labeltext3 = String()
    
    let cardDataSource = CardDataSource()
    
    @IBOutlet weak var receivedCardView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = labeltext1
        label3.text = labeltext2
        label2.text = labeltext3
        receivedCardView.image = UIImage(named: card!.templateID!.lowercaseString)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}