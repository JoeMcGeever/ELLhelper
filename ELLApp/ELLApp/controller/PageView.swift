//
//  PageView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 17/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import UIKit

class PageView: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        //VIEW CONTROLLER BEFORE:
        //returns view controller before this one
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil //fail safe
        }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            //return orderedViewControllers.last
            return nil //HERE IS WHAT HAPPENS WHEN YOU GET TO END OF BOOK - so swiping currently does nothing
            
            //maybe return segue
            
            
            
        }
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        //VIEW CONTOLER AFTER
        //Returns next view controller
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil //fail safe
        }
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewControllers.count != nextIndex else {
            //return orderedViewControllers.first
            return nil //if you scroll back at first part of book
        }
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
    
    
    lazy var orderedViewControllers: [UIViewController] = {
        //lazy means it isnt initialised until it is first used
        //here they store the page view controllers
        return [self.newView(view : "sbRed"),
                self.newView(view: "sbBlue")]
    }()
    
    var pageControl = UIPageControl() //programatically adding a page controller

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion :nil) // here it is nil, but if you wanted to do code every time the user swipes, here it is
            //so maybe for example (repeating this page over and over) ->  populate text and image with the next page stuff
        }

        self.delegate = self
        configurePageControl()
        
    }
    
    func configurePageControl() { //this configures where the page controller will be on the screen
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = orderedViewControllers.count //THIS IS TO EQUAL NUMBER OF PAGES IN STORY (AT THE MOMENT, THE NUMBER OF VIEW CONTROLLERS IN THE ARRAY)
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController)!
    }
    
    func newView(view : String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: view)
        //maybe change the lazy var to be one, and this function refreshes current view but with changed param
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
