//
//  UsersDummyData.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/23/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class UsersDummy {
    
    static var array : [User] = [
        
        User(firstName: "Anil", lastName: "Kumar", address:  Address(addressLine1: "Palam Colony", addressLine2: "Delhi", pinCode: 110077, landMark: "DadaDev"), email: "anilklal91@gmail.com", dob: NSDate().dateByAddingTimeInterval(12), password: "1234" ),
        
        
        User(firstName: "Ramesh", lastName: "Bhalla", address:  Address(addressLine1: "Pallval", addressLine2: "Punjab", pinCode: 110077, landMark: "DadaDev"), email: "ramesh91@gmail.com", dob: NSDate().dateByAddingTimeInterval(12), password: "!@#$"),
        
        User(firstName: "Suresh", lastName: "Kulkarni", address:  Address(addressLine1: "ConnaughtPlace", addressLine2: "Delhi", pinCode: 110077, landMark: "DadaDev"), email: "suresh91@gmail.com", dob: NSDate().dateByAddingTimeInterval(12), password: "12#$"),
        
        User(firstName: "Ankur", lastName: "Raina", address:  Address(addressLine1: "Panchvati", addressLine2: "Delhi", pinCode: 110077, landMark: "DadaDev"), email: "ankur91@gmail.com", dob: NSDate().dateByAddingTimeInterval(12), password: "an12"),
    
    User(firstName: "Ankush", lastName: "Raina", address:  Address(addressLine1: "", addressLine2: "", pinCode: 110077, landMark: "DadaDev"), email: "ankush91@gmail.com", dob: NSDate().dateByAddingTimeInterval(12), password: "qwer")
        
    ]
}