//
//  LoginModel.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/23/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

struct Login {
    
        let emailId: String?
        let password: String?
    
    init ( emailId: String?, password: String?) {
        self.emailId = emailId
        self.password = password
    }
}
