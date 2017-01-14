//
//  PageContentViewController.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 1/14/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit
import Kingfisher

class PageContentViewController: UIViewController {
    
   @IBOutlet weak var countCommentLabel: UILabel!
    @IBOutlet weak var developerName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var pageIndex: Int = 0
    var propertyCountComment: String!
    var propertyImage: String!
    var name_Property: String!
    var devName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.kf_setImageWithURL(NSURL(string: propertyImage))
        countCommentLabel.text =  propertyCountComment
        name.text = name_Property
        developerName.text = devName
    }
}
