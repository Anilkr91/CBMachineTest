//
//  UserModel.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/23/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

struct User {
    
    let firstName: String?
    let lastName: String?
    let address: Address?
    let email: String?
    let dob: NSDate?
    let password: String?
    
    init (firstName: String?, lastName: String?, address: Address, email: String?, dob: NSDate?, password: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.email = email
        self.dob = dob
        self.password = password
    }
}
