//
//  ViewController.swift
//  Central York School District
//
//  Created by Alex Santarelli on 6/4/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    var liveCompare:NSString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //creating the live button object
        /*
        let liveButton = PFObject(className: "Live")
        liveButton["LiveButton"] = "ON"
        liveButton["LiveURL"] = "http://www.cypanthers.org"
        liveButton.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Live Object has been saved.")

        }
        //Retriving the Live Button Data
        var query = PFQuery(className:"Live")
        query.getObjectInBackgroundWithId("yphRC9iOKW") {
          (liveButton: PFObject?, error: NSError?) -> Void in
          if error == nil && liveButton != nil {
            println(liveButton)
            var liveString:AnyObject? = liveButton!.objectForKey("LiveButton") as! NSString
            self.liveCompare = liveString as! NSString


            switch self.liveCompare {

            case "ON":
                //unhide the live button
                println("The Live button should be un-hidden.")
            case "OFF":
                //hide the live Button
                println("The Live Button should be hidden.")
              default:
                //hide the live button
                println("Check Parse, there was an error.")
            }

          } else {
            println(error)

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
*/
    }
}
