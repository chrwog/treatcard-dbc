//
//  SingleCardDetailsViewController.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/3/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit

class SingleCardDetailsViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    var viaSegue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = viaSegue
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}