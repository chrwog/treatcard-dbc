//
//  User.swift
//  treatcard-dbc
//
//  Created by chris shahin on 4/5/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import Foundation
import Alamofire

class User{
    
    internal var id: Int?
    internal var username: String?
    internal var email: String?
    internal var phone: String?
    
    
    init(id: Int, username: String, email: String, phone: String){
        self.id = id
        self.username = username
        self.email = email
        self.phone = phone
    }
    
    
    
}