//
//  LoginViewController.swift
//  carousel
//
//  Created by Stacey Gennoy on 11/6/15.
//  Copyright © 2015 Stacey Gennoy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var fieldParentView: UIView!
    
    @IBOutlet weak var buttonParentView: UIView!
    
    var fieldInitialY: CGFloat!
    var fieldOffset: CGFloat!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    
    
    func keyboardWillShow(notification: NSNotification!) {
        
        
        fieldParentView.frame.origin.y = fieldInitialY + fieldOffset
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        
        // print("Keyboard will show", buttonParentView.frame.origin.y, fieldParentView.frame.origin.y)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        
        fieldParentView.frame.origin.y = fieldInitialY
        buttonParentView.frame.origin.y = buttonInitialY
        
        // print("Keyboard will hide", buttonParentView.frame.origin.y, fieldParentView.frame.origin.y)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        fieldInitialY = fieldParentView.frame.origin.y
        fieldOffset = -100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -100


        // Do any additional setup after loading the view.
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
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
