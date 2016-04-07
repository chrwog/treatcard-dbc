//
//  Category.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/4/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

class Category {
    var templateID:String?
    var type:String?
    
    init(templateID: String, type: String) {
        self.templateID = templateID
        self.type = type
    }
}
