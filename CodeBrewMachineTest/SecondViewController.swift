//
//  SecondViewController.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 1/14/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//


import UIKit
import Alamofire

class SecondViewController: UIPageViewController, UIPageViewControllerDataSource
{

    var imagesArray : [PropertyModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         propertyFeed()
    }

    func propertyFeed() {
        
        let R  = Alamofire.request(.POST,  "http://54.254.204.73/api/property/feeds", parameters: ["lang": 20], encoding: .URLEncodedInURL, headers: nil).responseJSON { (request, response, data) in
            
            self.dataSource = self
            let jsonArray = GlossDataResponse<PropertyModel>(json: data.value as! [String: AnyObject])
         
            for (index, item ) in jsonArray!.arrayValue!.enumerate() {
               
                self.imagesArray.append(item)
                 print(self.imagesArray)
            }
            self.setViewControllers([self.getViewControllerAtIndex(0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        debugPrint(R)
    }
    
    // MARK:- UIPageViewControllerDataSource Methods
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        
        var index = pageContent.pageIndex
        
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        
        index--;
        return getViewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        
        var index = pageContent.pageIndex
        
        if (index == NSNotFound)
        {
            return nil;
        }
        
        index++;
        if (index == imagesArray.count)
        {
            return nil;
        }
        return getViewControllerAtIndex(index)
    }
    
    // MARK:- Other Methods
    func getViewControllerAtIndex(index: NSInteger) -> PageContentViewController
    {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! PageContentViewController
        
       pageContentViewController.propertyCountComment = "Comment Count:\(imagesArray[index].commentCount!)  Favour Count:\(imagesArray[index].favourCount!)"
        pageContentViewController.propertyImage = "\(imagesArray[index].propertyImage!)"
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
    }
}


