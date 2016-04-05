//
//  PersonalizeViewController.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/3/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI


class PersonalizeViewController: UIViewController  {
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addNotePersonal: UITextView!
    @IBAction func infoSend(sender: AnyObject) {
        let text = addNotePersonal.text
        print("\(text)")}
    
    @IBAction func showContactsPicker(sender: UIBarButtonItem) {
            let contactPicker = CNContactPickerViewController()
            contactPicker.displayedPropertyKeys = [CNContactPhoneNumbersKey, CNContactEmailAddressesKey]
            
            self.presentViewController(contactPicker, animated: true, completion: nil)
        }
    
    var labeltext = String()

    var card: Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Setting TextView Border programmatically
        addNotePersonal.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).CGColor
        addNotePersonal.layer.borderWidth = 2.0
        addNotePersonal.layer.cornerRadius = 10

        // This session shows template image and set the title of the personalize view
        
        navigationItem.title = card!.templateID?.capitalizedString
        selectedImage.image = UIImage(named: card!.templateID!.lowercaseString)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContactProperty contactProperty: CNContactProperty) {
        let contact = contactProperty.contact
        let phoneNumber = contactProperty.value as! CNPhoneNumber
        
        print(contact.givenName)
        print(phoneNumber.stringValue)
    }

    
}

