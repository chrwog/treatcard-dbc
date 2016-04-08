//
//  tempCard.swift
//  treatcard-dbc
//
//  Created by Baron Kwan on 4/6/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

class UserCard {
    var id:String?
    var to:String?
    var from:String?
    var greeting:String?
    var message:String?
    var occasion:String?
//    var cardID:String?

    init(id: String, to: String, from: String, greeting: String, message: String, occasion: String) {
//    init(id: String, to: String, from: String, greeting: String, message: String, occasion: String, cardId: String) {
        self.id = id
        self.to = to
        self.from = from
        self.greeting = greeting
        self.message = message
        self.occasion = occasion
//        self.cardId = cardID
    }
}