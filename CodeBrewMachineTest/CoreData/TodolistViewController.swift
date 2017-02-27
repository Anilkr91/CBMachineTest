//
//  TodolistViewController.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/21/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit
import CoreData

class TodolistViewController: UIViewController {
    
    @IBOutlet weak var taskTextfield: UITextField!
    @IBOutlet weak var taskDescTextfield: UITextField!
    @IBOutlet weak var saveTodoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveTodoButton.addTarget(self, action: #selector(TodolistViewController.saveTodo(_:)), forControlEvents: .TouchUpInside)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func saveTodo(sender: UIButton) {
        
        let task  = taskTextfield.text!.removeAllSpaces()
        let desc = taskDescTextfield.text!.removeAllSpaces()
        
//        let task = taskTextfield.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).stringByReplacingOccurrencesOfString(" ", withString: "")
//        let desc = taskDescTextfield.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).stringByReplacingOccurrencesOfString(" ", withString: "")
       
        if task.isEmpty  {
            print("empty please fill")
        } else if desc.isEmpty {
            print("empty please fill")
        } else {
//            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//            let managedContext = appDelegate.managedObjectContext
            
            //2
            let entity =  NSEntityDescription.entityForName("Todo", inManagedObjectContext: CoreDataUtils.getContext())
            let todo = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: CoreDataUtils.getContext())
            
            //3
            todo.setValue(task, forKey: "name")
            todo.setValue(desc, forKey: "desc")
            todo.setValue(NSDate(), forKey: "date")
            //4
            do {
                try CoreDataUtils.getContext().save()
                //5
//                self.navigationController?.popViewControllerAnimated(true)
                self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
                
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
    }
}