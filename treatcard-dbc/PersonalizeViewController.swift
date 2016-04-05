//
//  PersonalizeViewController.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/3/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit

class PersonalizeViewController: UIViewController {
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addNotePersonal: UITextView!
    
    var labeltext = String()
//    var newImage: UIImage!
    var card: Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = labeltext

        
        navigationItem.title = card!.templateID?.capitalizedString
        selectedImage.image = UIImage(named: card!.templateID!.lowercaseString)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}