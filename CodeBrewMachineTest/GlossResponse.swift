//
//  GlossResponse.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 1/14/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct GlossDataResponse<T: Decodable>: Glossy {
    
    let success: Int?
    let msg: Int?
    var arrayValue: [T]?
    

    
    init?(json: JSON) {
        self.success  = "success" <~~ json
        self.msg = "msg" <~~ json
        self.arrayValue = "feeds" <~~ json
        
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "success" ~~> self.success,
            "msg" ~~> self.msg,
            "feeds" ~~> self.arrayValue,
            
            ])
    }
}
