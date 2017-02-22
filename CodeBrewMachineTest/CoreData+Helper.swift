//
//  CoreData+Helper.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/22/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit
import CoreData

class CoreDataUtils {
    
    class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        return managedContext
    }
    
    class func readEntity(entityName: String) -> [AnyObject] {
        
        let fetchRequest = NSFetchRequest()
        var results : [AnyObject] = []
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entityForName(entityName, inManagedObjectContext: CoreDataUtils.getContext())
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        do {
            results = try CoreDataUtils.getContext().executeFetchRequest(fetchRequest)
        }
        catch {
            let fetchError = error as NSError
            print(fetchError)
        }
    return results
    }
}
