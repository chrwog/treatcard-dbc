//
//  tempCard.swift
//  treatcard-dbc
//
//  Created by Baron Kwan on 4/6/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

class tempCard {
    var id:String?
    var recipient:String?
    var greeting:String?
    var message:String?

    
    init(id: String, recipient: String, greeting:String, message: String) {
        self.id = id
        self.recipient = recipient
        self.greeting = greeting
        self.message = message
    }
}