//
//  OpeningViewController.swift
//  Central York School District
//
//  Created by Alex Santarelli on 6/6/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

import UIKit
import Parse

class OpeningViewController: UIViewController, NSURLConnectionDataDelegate {
  //let username:String = "17asantarelli"
    //creating the mutableData
    let data:NSMutableData = NSMutableData()
    
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
        //var classYear:String = self.username.substringToIndex(NSMakeRange(0, 1))
        //println()
        /*
        let studentObject = PFObject(className: "Student")
        studentObject[""] = "ghkjgjhkg"
        studentObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Student Object has been saved.")
        }
*/
        self.saveButton("17asantarelli", password: "94Estral")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //HomeButton Pressed
    // self.navigationController.popOverViewController.animated.YES
    
    //There will be no option to skip the setup in the next version
    
    func saveButton(username: String, password: String) {
        // if usernameTextField || passwordTextField == BLANK {
        // tell them to re-enter their information
        
        
        
        
 
        
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
        
        //******** THIS ALL HAPPENS AFTER WE HAVE VALIDATED THE USERNAME AND PASSWORD!!! ********
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
