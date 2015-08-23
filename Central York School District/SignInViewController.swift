//
//  SignInViewController.swift
//  Central York School District
//
//  Created by Alex Santarelli on 8/16/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, NSURLConnectionDataDelegate {
    
    //var connection:NSURLConnection = ()
    var recievedData:NSMutableData = NSMutableData()
    var connection:NSURLConnection = NSURLConnection()
    
    //Sign In BOX UI Elements
    //Be sure to change the image depending on the
    // verifed or non verified
    @IBOutlet weak var verificationImageView: UIImageView!
    
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    /* ALPHA FOR BACKGROUND VIEWS IS .9 */
    //Background View One
    //@IBOutlet weak var backgroundView1: UIView!
    @IBOutlet weak var background1: UIButton!
    @IBOutlet weak var background2: UIButton!
    @IBOutlet weak var background3: UIButton!
    @IBOutlet weak var background4: UIButton!
    @IBOutlet weak var progressView1: UIProgressView!
    @IBOutlet weak var progressView2: UIProgressView!
    @IBOutlet weak var progressView3: UIProgressView!
    @IBOutlet weak var progressView4: UIProgressView!
    
    //Background View Two
    //@IBOutlet weak var backgroundView2: UIView!
    @IBOutlet weak var background5: UIButton!
    @IBOutlet weak var background6: UIButton!
    @IBOutlet weak var background7: UIButton!
    @IBOutlet weak var background8: UIButton!
    @IBOutlet weak var progressView5: UIProgressView!
    @IBOutlet weak var progressView6: UIProgressView!
    @IBOutlet weak var progressView7: UIProgressView!
    @IBOutlet weak var progressView8: UIProgressView!
    
    var signedIn = false
    var backInt = 1
    var backButtonInt = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.verificationImageView.layer.zPosition = 5
        self.background1.layer.zPosition = 4
        self.background2.layer.zPosition = 5
        self.background3.layer.zPosition = 6
        self.background4.layer.zPosition = 7
        self.background5.layer.zPosition = 8
        self.background6.layer.zPosition = 9
        self.background7.layer.zPosition = 10
        self.background8.layer.zPosition = 11
        self.progressView1.layer.zPosition = 12
        self.progressView2.layer.zPosition = 13
        self.progressView3.layer.zPosition = 14
        self.progressView4.layer.zPosition = 15
        self.progressView5.layer.zPosition = 16
        self.progressView6.layer.zPosition = 17
        self.progressView7.layer.zPosition = 18
        self.progressView8.layer.zPosition = 19
        
        self.progressView1.progress = 0.0
        self.progressView2.progress = 0.0
        self.progressView3.progress = 0.0
        self.progressView4.progress = 0.0
        self.progressView5.progress = 0.0
        self.progressView6.progress = 0.0
        self.progressView7.progress = 0.0
        self.progressView8.progress = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func studentVerification() {
        var username = self.usernameField.text
        var password = self.passwordField.text
        
        //If there is a connection, it needs cancelled
        //connection.cancel()
        self.connection.cancel()
        
        //initalize new mutable data
        var data = NSMutableData()
        self.recievedData = data
        
        //creating an NSURL with the target location we need
        var url:NSURL = NSURL(string: "https://www.cypanthers.org/ios/auth.php")!
        
        var request:NSMutableURLRequest =  NSMutableURLRequest(URL:url.standardizedURL!)
        
        request.HTTPMethod = "POST"
        
        var sendingData = NSString(format: "username=%@&password=%@&apikey=dFCbdEVD8apyvMEX", username, password)
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.HTTPBody = sendingData.dataUsingEncoding(NSUTF8StringEncoding)
        
         var connection:NSURLConnection =  NSURLConnection(request: request, delegate: self)!
        
        self.connection = connection
        
        connection.start()
        
    }

    @IBAction func keyboardResign(sender: AnyObject) {
        self.usernameField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
    }
    
    
    
    @IBAction func signInButton(sender: AnyObject) {
        self.studentVerification()
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        println("connection recieved data")
        self.recievedData.appendData(data)
        println("recieved data \(self.recievedData)")
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        println("connection finished loading")
        var responseString:NSString = NSString(data: self.recievedData, encoding: NSUTF8StringEncoding)!
        if responseString.isEqualToString("1") {
            println("Student was verified")
            
            NSUserDefaults.standardUserDefaults().setObject(usernameField.text, forKey: "USERNAME")
            NSUserDefaults.standardUserDefaults().setObject(passwordField.text, forKey: "PASSWORD")
            //go through array of students 
            // that are MCL Students and take them to a different home.
            
            //hide everything in the sign up box
            
            //image to make sure its the correct image
            let verifiedImage:UIImage = UIImage(named: "Verified")!
            self.verificationImageView.image = verifiedImage
            UIView.animateWithDuration(1.0, animations: {
                self.usernameLabel.alpha = 0.0
                self.usernameField.alpha = 0.0
                self.passwordLabel.alpha = 0.0
                self.passwordField.alpha = 0.0
                self.signInButton.alpha = 0.0
                self.verificationImageView.alpha = 1.0
            })
            self.view.layoutIfNeeded()
            self.signInLabel.text = "Signed In."
            
            signedIn = true
    
        
        } else if responseString.isEqualToString("0") {
            println("Username is incorrect")
            let unverifiedImage:UIImage = UIImage(named: "UnVerified")!
            self.verificationImageView.image = unverifiedImage
            UIView.animateWithDuration(2.5, animations: {
                self.usernameLabel.alpha = 0.0
                self.usernameField.alpha = 0.0
                self.passwordLabel.alpha = 0.0
                self.passwordField.alpha = 0.0
                self.signInButton.alpha = 0.0
                self.verificationImageView.alpha = 1.0
                
            })
            self.view.layoutIfNeeded()
            self.signInLabel.text = "Please try again."
            
            UIView.animateWithDuration(1.8, animations: {
                self.usernameLabel.alpha = 1.0
                self.usernameField.alpha = 1.0
                self.passwordLabel.alpha = 1.0
                self.passwordField.alpha = 1.0
                self.signInButton.alpha = 1.0
                self.verificationImageView.alpha = 0.0
            })
            
            signedIn = false
            
        }
        println("Response String \(responseString)")
    }
    
    func goToHome(num: Int) {
        NSUserDefaults.standardUserDefaults().setObject(num, forKey: "BackgroundInt")
        switch num {
        case 1:
            self.progressView1.progress = 1.0
            self.progressView2.progress = 0.0
            self.progressView3.progress = 0.0
            self.progressView4.progress = 0.0
            self.progressView5.progress = 0.0
            self.progressView6.progress = 0.0
            self.progressView7.progress = 0.0
            self.progressView8.progress = 0.0
        case 2:
            self.progressView1.progress = 0.0
            self.progressView2.progress = 1.0
            self.progressView3.progress = 0.0
            self.progressView4.progress = 0.0
            self.progressView5.progress = 0.0
            self.progressView6.progress = 0.0
            self.progressView7.progress = 0.0
            self.progressView8.progress = 0.0
        case 3:
            self.progressView1.progress = 0.0
            self.progressView2.progress = 0.0
            self.progressView3.progress = 1.0
            self.progressView4.progress = 0.0
            self.progressView5.progress = 0.0
            self.progressView6.progress = 0.0
            self.progressView7.progress = 0.0
            self.progressView8.progress = 0.0
        case 4:
            self.progressView1.progress = 0.0
            self.progressView2.progress = 0.0
            self.progressView3.progress = 0.0
            self.progressView4.progress = 1.0
            self.progressView5.progress = 0.0
            self.progressView6.progress = 0.0
            self.progressView7.progress = 0.0
            self.progressView8.progress = 0.0
        case 5:
            self.progressView1.progress = 0.0
            self.progressView2.progress = 0.0
            self.progressView3.progress = 0.0
            self.progressView4.progress = 0.0
            self.progressView5.progress = 1.0
            self.progressView6.progress = 0.0
            self.progressView7.progress = 0.0
            self.progressView8.progress = 0.0
        case 6:
            self.progressView1.progress = 0.0
            self.progressView2.progress = 0.0
            self.progressView3.progress = 0.0
            self.progressView4.progress = 0.0
            self.progressView5.progress = 0.0
            self.progressView6.progress = 1.0
            self.progressView7.progress = 0.0
            self.progressView8.progress = 0.0
        case 7:
            self.progressView1.progress = 0.0
            self.progressView2.progress = 0.0
            self.progressView3.progress = 0.0
            self.progressView4.progress = 0.0
            self.progressView5.progress = 0.0
            self.progressView6.progress = 0.0
            self.progressView7.progress = 1.0
            self.progressView8.progress = 0.0
        case 8:
            self.progressView1.progress = 0.0
            self.progressView2.progress = 0.0
            self.progressView3.progress = 0.0
            self.progressView4.progress = 0.0
            self.progressView5.progress = 0.0
            self.progressView6.progress = 0.0
            self.progressView7.progress = 0.0
            self.progressView8.progress = 1.0
        default:
            self.progressView1.progress = 0.0
            self.progressView2.progress = 0.0
            self.progressView3.progress = 0.0
            self.progressView4.progress = 0.0
            self.progressView5.progress = 0.0
            self.progressView6.progress = 0.0
            self.progressView7.progress = 0.0
            self.progressView8.progress = 0.0
        }
        
    }
    
    @IBAction func background1(sender: AnyObject) {
        self.goToHome(1)
    }
    
    @IBAction func background2(sender: AnyObject) {
        self.goToHome(2)
    }
    
    @IBAction func background3(sender: AnyObject) {
        self.goToHome(3)
    }
    
    @IBAction func background4(sender: AnyObject) {
        self.goToHome(4)
    }
    
    @IBAction func background5(sender: AnyObject) {
        self.goToHome(5)
    }
    
    @IBAction func background6(sender: AnyObject) {
        self.goToHome(6)
    }
    
    @IBAction func background7(sender: AnyObject) {
        self.goToHome(7)
    }
    
    @IBAction func background8(sender: AnyObject) {
        self.goToHome(8)
    }
}


