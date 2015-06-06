//
//  MainViewControllerSwift.swift
//  Central
//
//  Created by Alex Santarelli on 6/3/15.
//  Copyright (c) 2015 iInnovate App Design. All rights reserved.
//

import UIKit
import Parse

class MainViewControllerSwift: UIViewController {
    var backgroundString:NSString = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        //let openDefault: String? = NSUserDefaults.standardUserDefaults().objectForKey("OPEN") as? String
        //if openDefault as! String == nil {
            //if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad {
               // self.performSegueWithIdentifier("Open", sender: self)
            //} else {
                //self.performSegueWithIdentifier("OpenPhone", sender: self)
            //}

            //openDefault?.setObject("OPENED", forKey: "OPEN")

        //}
        //Remove once Object has been created.

        var backgroundPicDefault = NSUserDefaults.standardUserDefaults().objectForKey("Background") as! String

        switch backgroundPicDefault {
        case "Outside":
            println("The background was set to Outside.")
            let image:UIImage = UIImage(named: "Outside.png")!
            //set the image to the image view
        case "Library":
            println("The Background was set to The Library.")
            let image2:UIImage = UIImage(named: "Library.png")!
        case "Atrium":
            println("The Background was set to the Atrium.")
            let image3:UIImage = UIImage(named: "roof_done.png")!
        //For new backgrounds
        case "Dandelion":
            println("The Background was set to the Dandelion")
            let image4:UIImage = UIImage(named: "dandelion_school.png")!
        default:
            println("Default, Background was set to Outside.")

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}
