//
//  TodoListingTableViewController.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/21/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit
import CoreData

class TodoListingTableViewController: UITableViewController {
    
    var array : [TodoModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataEntity()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Todo", forIndexPath: indexPath)
        
        cell.textLabel!.text = array[indexPath.row].name
        cell.detailTextLabel!.text = array[indexPath.row].desc
        return cell
    }
    
    func fetchCoreDataEntity()  {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest()
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entityForName("Todo", inManagedObjectContext: managedContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
    
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            for (k,v) in results.enumerate() {
                let todoObj = TodoModel(name: v.valueForKey("name") as? String, desc: v.valueForKey("desc") as? String, date: v.valueForKey("date") as? NSDate)
                 array.append(todoObj)
            }
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
    }
    
}
