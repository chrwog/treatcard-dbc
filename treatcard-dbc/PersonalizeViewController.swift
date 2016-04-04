//
//  PersonalizeViewController.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/3/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit

class PersonalizeViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var labeltext = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labeltext
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}