//
//  UsersCards.swift
//  treatcard-dbc
//
//  Created by chris shahin on 4/6/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import Foundation

//
//  UsersCards.swift
//  treatcard-dbc
//
//  Created by chris shahin on 4/6/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import Foundation

class UsersCards{
    var id: Int?
    var to: String?
    var from: String?
    var message: String?
    var cardId: Int?
    
    init(id: Int, to: String, from: String, message: String, cardId: Int){
        self.id = id
        self.to = to
        self.from = from
        self.message = message
        self.cardId = cardId
        
    }
    
}
