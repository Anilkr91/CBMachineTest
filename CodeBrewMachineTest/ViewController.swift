//
//  ViewController.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 1/13/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        propertyFeed()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func propertyFeed() {
        
    let R  = Alamofire.request(.POST,  "http://54.254.204.73/api/property/feeds", parameters: ["lang": 0], encoding: .URLEncodedInURL, headers: nil).responseJSON { (request, response, data) in
        
         let jsonArray = GlossDataResponse<PropertyModel>(json: data.value as! [String: AnyObject])
        
            print(jsonArray)
            
        }
        debugPrint(R)
    }
}