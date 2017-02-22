//
//  TodoModel.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/21/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Foundation

struct TodoModel {
    
    let date: NSDate?
    let desc: String?
    let name: String?
    
    init(name: String?, desc: String?, date: NSDate?) {
        self.name = name
        self.desc =  desc
        self.date = date
    }
}