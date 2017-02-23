

//
//  ExtensionHelpers.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/23/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit


// String Extension
extension String {
    func removeAllSpaces () -> String {
        let components = componentsSeparatedByCharactersInSet(.whitespaceCharacterSet())
        return components.joinWithSeparator("")
    }
}
