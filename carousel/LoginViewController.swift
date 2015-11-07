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
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signinIndicator: UIActivityIndicatorView!
    
    @IBAction func didPressBackButton(sender: AnyObject) {
       // print("Did press back button")
    }
    
    @IBAction func didPressSignInButton(sender: AnyObject) {
       // print("Did press sign in button")
        
        // Start animating the activity indicator
        signinIndicator.startAnimating()
        
        // Set the Button state to "Selected"
        signInButton.selected = true
        
        // If both the email and password fields match what we are looking for...
        if emailField.text == "email@email.com" && passwordField.text == "1234" {
            // Delay for 2 second.
            delay(2, closure: { () -> () in
                print("valid")
                // Stop animating the activity indicator.
                self.signinIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.signInButton.selected = false
                // perform the Segue to the next screen.
                // self.performSegueWithIdentifier("yourSegue", sender: nil)
            })
            // Otherwise, email or password are incorrect so...
        } else {
            // Delay for 2 second
            delay(2, closure: { () -> () in
                print("invalid")
                // Stop animating the activity indicator.
                self.signinIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.signInButton.selected = false
                // Create and Show UIAlertController...see guide, Using UIAlertController
                let alert = UIAlertController(title: "Oops", message: "Incorrect email or password", preferredStyle: UIAlertControllerStyle.Alert)
                
                let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                
                alert.addAction(okAction)
                
                self.presentViewController(alert, animated: true, completion: nil)
                
            })
        }
    }
    

    
    
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
