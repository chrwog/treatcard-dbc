//
//  Card.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/4/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

class Card {
    var id: String?
    var name: String?
    var templateID: String?
    
    init(id: String, name: String, templateID: String) {
        self.id = id
        self.name = name
        self.templateID = templateID
    }
}
