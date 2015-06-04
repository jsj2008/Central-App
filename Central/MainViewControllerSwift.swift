//
//  MainViewControllerSwift.swift
//  Central
//
//  Created by Alex Santarelli on 6/3/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

import UIKit
import Parse

class MainViewControllerSwift: UIViewController {
    var backgroundString:NSString = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let openDefault = NSUserDefaults.standardUserDefaults().objectForKey("OPEN")
        if !openDefault {
            if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad {
                self.performSegueWithIdentifier("Open", sender: self)
            } else {
                self.performSegueWithIdentifier("OpenPhone", sender: self)
            }
            
            openDefault?.setObject("OPENED", forKey: "OPEN")
            
        }
        //Remove once Object has been created.
        let liveButton = PFObject(className: "Live")
        liveButton["LiveButton"] = "ON"
        liveButton["LiveURL"] = "http://www.cypanthers.org"
        liveButton.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Live Object has been saved.")
        }
        
        var backgroundPicDefault = NSUserDefaults.standardUserDefaults().objectForKey("Background")
        
        switch backgroundPicDefault {
        case "Outside":
            println("The background was set to Outside.")
            let image:UIImage = UIImage(named: "Outside.png")
            //set the image to the image view
        case "Library":
            println("The Background was set to The Library.")
            let image2:UIImage = UIImage(named: "Library.png")
        case "Atrium":
            println("The Background was set to the Atrium.")
            let image3:UIImage = UIImage(named: "roof_done.png")
        default:
            println("Default, Background was set to Outside.")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
