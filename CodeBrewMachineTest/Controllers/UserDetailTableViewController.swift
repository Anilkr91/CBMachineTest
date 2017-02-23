//
//  UserDetailTableViewController.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 2/23/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class UserDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var adressLine1TextField: UITextField!
    @IBOutlet weak var adressLine2TextField: UITextField!
    @IBOutlet weak var pincodeTextField: UITextField!
    @IBOutlet weak var landMarkTextField: UITextField!
    
    var user: User?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserDetail()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setupUserDetail() {
        firstNameTextField.text = user?.firstName
        secondNameTextField.text = user?.lastName
        emailTextField.text = user?.email
        adressLine1TextField.text = user?.address?.addressLine1
        adressLine2TextField.text = user?.address?.addressLine2
        pincodeTextField.text = user?.address?.addressLine2
        landMarkTextField.text = user?.address?.landMark
    }
    
    @IBAction func updateTapped() {
        
        let address = Address(addressLine1: adressLine1TextField.text, addressLine2: adressLine2TextField.text, pinCode: Int(pincodeTextField.text!), landMark: landMarkTextField.text)
        
        let  updatedObj = User(firstName: firstNameTextField.text, lastName: secondNameTextField.text, address: address, email: emailTextField.text, dob: user!.dob, password: user!.password)
        
        
        UsersDummy.array[index!] = updatedObj
        self.navigationController?.popViewControllerAnimated(true)
        
    }
}