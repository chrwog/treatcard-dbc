//
//  SessionUser.swift
//  treatcard-dbc
//
//  Created by chris shahin on 4/6/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import Foundation

//
//  SessionUser.swift
//  treatcard-dbc
//
//  Created by chris shahin on 4/6/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import Foundation

class SessionUser{
    internal var user: User?
    internal var recievedCards: [UsersCards]?
    internal var sentCards: [UsersCards]?
    init(user: User){
        self.user = user
        setRecievedCards()
        setSentCards()
    }
    
    private func setRecievedCards(){
        
        self.recievedCards = [UsersCards(id:1, to: "bob", from: "mike", message: "this is a message", cardId: 1), UsersCards(id:2, to: "bob", from: "mike", message: "this is a message", cardId: 2), UsersCards(id:3, to: "bob", from: "mike", message: "this is a message", cardId: 3)]
    }
    
    private func setSentCards(){
        
        self.sentCards = [UsersCards(id:1, to: "bob", from: "mike", message: "this is a message", cardId: 1), UsersCards(id:2, to: "bob", from: "mike", message: "this is a message", cardId: 2), UsersCards(id:3, to: "bob", from: "mike", message: "this is a message", cardId: 3)]
    }
}
