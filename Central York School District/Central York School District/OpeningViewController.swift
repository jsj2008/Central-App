//
//  OpeningViewController.swift
//  Central York School District
//
//  Created by Alex Santarelli on 6/6/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

import UIKit
import Parse

class OpeningViewController: UIViewController {
  let username:String = "17asantarelli"

    override func viewDidLoad() {
        super.viewDidLoad()
        //Looking for the Username of the Student to see
        // If they already have user Data
        //right now we are taking the username from
        //a string but when we go to start building the UI
        //we will add the username text field is where we are grabbing the username

        //We have to splice the string because Parse doesn't like
        // the numbers starting off the string
        //var usernameSplice = self.username.componentsSeparatedByString("17")
        var classYear:String = self.username.substringToIndex(NSMakeRange(0, 1))
        println()
        
        let studentObject = PFObject(className: "Student")
        studentObject[""] = "ghkjgjhkg"
        studentObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Student Object has been saved.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
