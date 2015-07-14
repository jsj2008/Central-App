//
//  OpeningViewController.swift
//  Central York School District
//
//  Created by Alex Santarelli on 6/6/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

import UIKit
import Parse
import Foundation

class OpeningViewController: UIViewController, NSURLConnectionDataDelegate {
    
    @IBOutlet weak var openViewBackground: UIImageView!
    
    var timerIncrement:Int = 2
    
    
  //let username:String = "17asantarelli"
    //creating the mutableData
    let data:NSMutableData = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "Welcome!"
        //Looking for the Username of the Student to see
        // If they already have user Data
        //right now we are taking the username from
        //a string but when we go to start building the UI
        //we will add the username text field is where we are grabbing the username

        //We have to splice the string because Parse doesn't like
        // the numbers starting off the string
        //var usernameSplice = self.username.componentsSeparatedByString("17")
        //var classYear:String = self.username.substringToIndex(NSMakeRange(0, 1))
        //println()
        /*
        let studentObject = PFObject(className: "Student")
        studentObject[""] = "ghkjgjhkg"
        studentObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Student Object has been saved.")
        }
        
        
*/
        //Creating the Swipe Gesture to move to the next view. 
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("continueToOpening"))
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("continueToOpening"))
        //Setting the Direction of the Swipes.
        swipeRight.direction = .Right
        swipeLeft.direction = .Left
        //Adding the gestures to the view.
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeLeft)
        //Adding the timer for the picture fade
        var fadeTimer:NSTimer? = nil
        
        fadeTimer = NSTimer(timeInterval: 5.0, target: self, selector: "changeBackgrounds", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(fadeTimer!, forMode: NSRunLoopCommonModes)
        
        self.saveButton("17asantarelli", password: "94Estral")
    }
    
    func continueToOpening() {
        let openChoiceController = self.storyboard!.instantiateViewControllerWithIdentifier("openChoice") as! OpenChoiceViewController
        self.presentViewController(openChoiceController, animated: false, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeBackgrounds() {
        
        let image1:UIImage = UIImage(named: "Opening Background 1")!
        let image2:UIImage = UIImage(named: "Opening Background 2")!
        let image3:UIImage = UIImage(named: "Opening Background 3")!
        
        switch self.timerIncrement {
        case 1:
            self.timerIncrement++
            println("This is the Panther Background")
            //self.openViewBackground = UIImageView(image: image1)
            self.changeBackgroundAnimation(image1)
        case 2:
            self.timerIncrement++
            println("This is the Atrium Background")
            //self.openViewBackground = UIImageView(image: image2)
            self.changeBackgroundAnimation(image2)
        case 3:
            println("This is the Dandelion Background")
            //self.openViewBackground = UIImageView(image: image3)
            self.changeBackgroundAnimation(image3)
            self.timerIncrement = 1
        default:
            println("There was an error. Check the Value of the timerIncrement.")
        }
    }
    
    func changeBackgroundAnimation(background: UIImage) {
        //Fading Out
        UIView.animateWithDuration(1.0, animations: {
            self.openViewBackground.alpha = 0.75
        })
        
        
        //Fading In
        self.openViewBackground.image = background
        //self.openViewBackground.alpha = 0.75
        UIView.animateWithDuration(1.0, animations: {
            self.openViewBackground.alpha = 1.00
        })
    }
    //HomeButton Pressed
    // self.navigationController.popOverViewController.animated.YES
    
    //There will be no option to skip the setup in the next version
    
    func saveButton(username: String, password: String) {
        // if usernameTextField || passwordTextField == BLANK {
        // tell them to re-enter their information
        
        
        
        
        /*
        
        let verificationURLString = "https://www.cypanthers.org/ios/auth.php"
        
        let verificationURL:NSURL = NSURL(string: verificationURLString)!
        
        let verificationRequest = NSMutableURLRequest(URL: verificationURL)
        
        verificationRequest.URL?.standardizedURL
        
        verificationRequest.HTTPMethod = "POST"
    
        let postData:NSString = NSString(format: "username=%@&password=%@&apikey=dFCbdEVD8apyvMEX", username, password)
        
        verificationRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        verificationRequest.HTTPBody = postData.dataUsingEncoding(NSUTF8StringEncoding)
        
        //Before we start a connection we see if there is already a connection and cancel so we donb't have any issues.
        let connection:NSURLConnection = NSURLConnection(request: verificationRequest, delegate: self)!
        connection.cancel()
        
        connection.start()
        
        // ******** THIS ALL HAPPENS AFTER WE HAVE VALIDATED THE USERNAME AND PASSWORD!!! ********
        //let classYear = username.substringToIndex(NSMakeRange(0, 2))
        let classYear = 17
        let SUBusername = "asantarelli"
        //
        //Substringing the index
        
        //Saving the user name and password as defaults so we can
        //access them globally.
        NSUserDefaults.standardUserDefaults().setObject(username, forKey: "USERNAME")
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "PASSWORD")
        
        
        //clear all channels because it is a new user
        //you clear teh channels by assignning them an empty array
        let clearChannel:NSArray = []
        
        //creating the installation and setting the empty arrays to it
        let install = PFInstallation.currentInstallation()
        install.channels = clearChannel as [AnyObject]
        install.saveEventually()
        
        //After the channels are cleared we can add the new objects safely because we cleared the old
        install.addUniqueObject(classYear, forKey: "channels")
        install.addUniqueObject(username, forKey: "channels")
        //save the channels imediately 
        install.saveInBackground()
    
        */
        
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        self.data.appendData(data)
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        println("There was an error signing in.\n %@", error)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        //intialize converting of the recieved data to string with UTF8 encoding
        var htmlString = NSString(data: self.data, encoding: NSUTF8StringEncoding)
        let recievedDataString = htmlString
        println("Recieved Data Successfully. %@", recievedDataString)
        
        if (recievedDataString?.isEqualToString("1") != nil) {
            println("Access Granted. The Student's information is correct. ")
            NSUserDefaults.standardUserDefaults().setObject("YES", forKey: "VALIDATED")
        } else {
            println("Access Denied. The Student's information is incorrect. ")
            //send alert to try agin because thier information waas incorrect.
        }
    }
}
