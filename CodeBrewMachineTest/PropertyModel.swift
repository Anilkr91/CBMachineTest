//
//  PropertyModel.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 1/13/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//


import Gloss

struct PropertyModel: Decodable {
    
    let id: Int?
    let propertyName: String?
    let districtName: String?
    let saleDate: String?
    let propertyImage: String?
    
    // MARK: - Deserialization
    
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.propertyName = "property_name" <~~ json
        self.districtName = "district_name" <~~ json
        self.saleDate = "sale_date" <~~ json
        self.propertyImage = "image" <~~ json
        
    }
    
}
