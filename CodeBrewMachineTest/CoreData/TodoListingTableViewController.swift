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
        array.removeAll()
        iterateEntity(CoreDataUtils.readEntity("Todo"))
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Todo", forIndexPath: indexPath)
        if indexPath.row%2 == 0 {
            cell.backgroundColor = UIColor.purpleColor()
        } else {
            cell.backgroundColor = UIColor.brownColor()
        }
        cell.textLabel!.text = array[indexPath.row].name!
        cell.detailTextLabel!.text = array[indexPath.row].desc
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            print("delete called \(indexPath.row)")
            deleteTodoFromCoreData(array[indexPath.row],todoArray: CoreDataUtils.readEntity("Todo"))
        }
    }
    
    //Mark: Read core data objects
    func iterateEntity(todoArray: [AnyObject]) {
        for (_,v) in todoArray.enumerate() {
            let todoObj = TodoModel(name: v.valueForKey("name") as? String, desc: v.valueForKey("desc") as? String, date: v.valueForKey("date") as? NSDate)
            array.append(todoObj)
        }
        tableView.reloadData()
    }
    
    
    func deleteTodoFromCoreData(object: TodoModel, todoArray: [AnyObject]) {
        
        for (_,v) in todoArray.enumerate() {
            if object.name == v.valueForKey("name") as? String {
                print(v)
                CoreDataUtils.getContext().deleteObject(v as! NSManagedObject)
            }
        }
        do {
            try CoreDataUtils.getContext().save()
            array.removeAll()
            iterateEntity(CoreDataUtils.readEntity("Todo"))
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
}
