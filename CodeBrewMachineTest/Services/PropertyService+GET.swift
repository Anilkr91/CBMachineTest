//
//  PropertyService+GET.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/15/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss
import Alamofire

class PropertyGETService {
    static func getProperty(params: [String: AnyObject], completionHandler: (AnyObject) -> Void) {
        Alamofire.request(.POST, "http://54.254.204.73/api/property/feeds", parameters: params)
            .responseJSON(completionHandler: { (request, response, result) in
                completionHandler(result.value!)
            })
    }
}
