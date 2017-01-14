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
    @IBOutlet weak var imageView: UIImageView!
    
    var pageIndex: Int = 0
    var propertyCountComment: String!
    var propertyImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(propertyImage)
        imageView.kf_setImageWithURL(NSURL(string: propertyImage))
        countCommentLabel.text =  propertyCountComment 
    }
}
