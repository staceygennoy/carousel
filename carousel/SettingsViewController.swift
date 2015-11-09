//
//  SettingsViewController.swift
//  carousel
//
//  Created by Stacey Gennoy on 11/8/15.
//  Copyright © 2015 Stacey Gennoy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var navImage: UIImageView!
    
    @IBOutlet weak var signOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         scrollView.contentSize = imageView.image!.size
    }

    
    @IBAction func didPressCloseButton(sender: AnyObject) {
        print("did press close button")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didPressSignOutButton(sender: AnyObject) {
        print("did press sign out button")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
