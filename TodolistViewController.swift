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
        saveTodoButton.backgroundColor = UIColor.redColor()
        saveTodoButton.addTarget(self, action: #selector(TodolistViewController.saveTodo(_:)), forControlEvents: .TouchUpInside)
        //        taskTextfield.delegate = self
        //        taskDescTextfield.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func saveTodo(sender: UIButton) {
        
        if taskTextfield.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).isEmpty {
            print("empty please fill")
        } else if taskTextfield.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).isEmpty {
            print("empty please fill")
        } else {
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            //2
            let entity =  NSEntityDescription.entityForName("Todo", inManagedObjectContext: managedContext)
            let todo = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            //3
            todo.setValue(taskTextfield.text, forKey: "name")
            todo.setValue(taskDescTextfield.text, forKey: "desc")
            todo.setValue(NSDate(), forKey: "date")
            //4
            do {
                try managedContext.save()
                //5
                //user.append(person)
                self.navigationController?.popViewControllerAnimated(true)
                
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
    }
}

//extension TodolistViewController: UITextFieldDelegate {
//
//    func textFieldDidEndEditing(textField: UITextField) {
//
//        if taskTextfield.hasText() && taskDescTextfield.hasText() {
//              saveTodoButton.addTarget(self, action: #selector(TodolistViewController.saveTodo(_:)), forControlEvents: .TouchUpInside)
//            saveTodoButton.enabled = true
//            saveTodoButton.backgroundColor = UIColor.greenColor()
//            print(taskDescTextfield.text)
//            print(taskTextfield.text)
//        }
//    }
//
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    
//}
