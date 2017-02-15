//
//  SecondViewController.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 1/14/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//


import UIKit
import Alamofire

class SecondViewController: UIPageViewController, UIPageViewControllerDataSource {

    var imagesArray : [PropertyModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         propertyFeed()
    }

    func propertyFeed() {
        PropertyGETService.getProperty(["lang": 0]) { (json) in
            self.dataSource = self
            let jsonArray = GlossDataResponse<PropertyModel>(json: json as! [String: AnyObject])
            self.imagesArray = (jsonArray?.arrayValue)!
             self.setViewControllers([self.getViewControllerAtIndex(0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
    }
    
    // MARK:- UIPageViewControllerDataSource Methods
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        
        var index = pageContent.pageIndex
        
        if ((index == 0) || (index == NSNotFound)) {
            return nil
        }
        index -= 1;
        return getViewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
       
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        var index = pageContent.pageIndex
        
        if (index == NSNotFound) {
            return nil;
        }
        
        index += 1;
        if (index == imagesArray.count) {
            return nil;
        }
        return getViewControllerAtIndex(index)
    }
    
    // MARK:- Other Methods
    func getViewControllerAtIndex(index: NSInteger) -> PageContentViewController {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! PageContentViewController
        pageContentViewController.name_Property =  imagesArray[index].propertyName! + "\n" + imagesArray[index].districtName! + "\n" + imagesArray[index].saleDate!
       pageContentViewController.propertyCountComment = "Comment:\(imagesArray[index].commentCount!) Favour:\(imagesArray[index].favourCount!)"
        pageContentViewController.propertyImage = "\(imagesArray[index].propertyImage!)"
        pageContentViewController.pageIndex = index
        pageContentViewController.devName = imagesArray[index].devName![0]
        return pageContentViewController
    }
}