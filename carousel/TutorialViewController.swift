//
//  TutorialViewController.swift
//  carousel
//
//  Created by Stacey Gennoy on 11/7/15.
//  Copyright © 2015 Stacey Gennoy. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var scrollViewDidEndDecelerating: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let pageWidth = scrollView.bounds.width
        let pageHeight = scrollView.bounds.height
        
        scrollView.contentSize = CGSizeMake(4*pageWidth, pageHeight)
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        

       scrollView.delegate = self
    
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
