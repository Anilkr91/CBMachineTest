//
//  LoginViewController.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/23/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var user: User?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.text = "ramesh91@gmail.com"
        passwordTextField.text = "!@#$"
        
    }
    
    @IBAction func loginTapped() {
        
        if emailTextField.text!.removeAllSpaces().isEmpty {
            print("email is empty")
            
        } else if passwordTextField.text!.removeAllSpaces().isEmpty {
            print("password is empty")
        } else {
            user = getUserFromUsers()
            
            if user != nil {
                performSegueWithIdentifier("goToUserSegue", sender: self)
            } else {
                print(" Not Registered")
            }
            
        }
    }
    
    func getUserFromUsers() -> User? {
        
        var user: User?
        for (key,userObj) in UsersDummy.array.enumerate(){
            if emailTextField.text == userObj.email && passwordTextField.text == userObj.password {
                user = userObj
                index = key
                break
            }
        }
        return user
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToUserSegue" {
            let dvc = segue.destinationViewController as! UserDetailTableViewController
            dvc.user = user
            dvc.index = index
        }
    }
}