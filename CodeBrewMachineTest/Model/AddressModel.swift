
//
//  AddressModel.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/23/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

struct  Address {
    
    let addressLine1: String?
    let addressLine2: String?
    let pinCode: Int?
    let landMark: String?
    
    init(addressLine1: String?, addressLine2: String?, pinCode: Int?, landMark: String?){
    self.addressLine1 = addressLine1
    self.addressLine2 = addressLine2
    self.pinCode = pinCode
    self.landMark = landMark
    }
    
}
