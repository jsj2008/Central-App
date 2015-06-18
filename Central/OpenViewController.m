//
//  OpenViewController.m
//  Central
//
//  Created by Caleb Linburg on 1/17/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import "OpenViewController.h"
#import "Parse/Parse.h"

@interface OpenViewController ()

@end

@implementation OpenViewController

- (IBAction)doneSkipPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)homePressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

    //[self performSegueWithIdentifier:@"Home" sender:self];
}
- (IBAction)skipPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

    //[self performSegueWithIdentifier:@"Home" sender:self];
}

- (IBAction)savePressed:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setObject:_usernameBlank.text forKey:@"USERNAME"];
    [[NSUserDefaults standardUserDefaults] setObject:_passwordBlank.text forKey:@"PASSWORD"];
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"USERNAME"]) {
        _usernameBlank.hidden = NO;
        _passwordBlank.hidden = NO;
        //_usernameLabel.hidden = NO;
        //_passwordLabel.hidden = NO;
        
    } else {
       // _usernameBlank.hidden = YES;
        //_passwordBlank.hidden = YES;
       // _usernameLabel.hidden = YES;
        //_passwordLabel.hidden = YES;
    }
    
    if([_usernameBlank.text isEqualToString:@""] || [_passwordBlank.text isEqualToString:@""]){
        NSLog(@"BLANK___________________________________________________________");
    }
    else{
    NSString *username = _usernameBlank.text;
    NSString *password = _passwordBlank.text;
    
    if(![username isEqualToString:@""]){
        
    }
    else{
        NSLog(@"Blank Username");
    }
    
    NSString *classYear = [username substringToIndex:2];
    NSString *newUsername = [NSString stringWithFormat:@"U%@", username];
    NSString *newClassYear = [NSString stringWithFormat:@"C%@", classYear];
    
    // NSLog(classYear);
    
    //clear all channels
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    currentInstallation.channels = [NSArray array];
    [currentInstallation saveEventually];
    
    //add channels
    [currentInstallation addUniqueObject:newClassYear forKey:@"channels"];
    [currentInstallation addUniqueObject:newUsername forKey:@"channels"];
    [currentInstallation saveInBackground];
    
    
        //if there is a connection going on just cancel it.
        [self.connection cancel];
        
        //initialize new mutable data
        NSMutableData *data = [[NSMutableData alloc] init];
        self.receivedData = data;
        //[data release];
        
        //initialize url that is going to be fetched.
        NSURL *url = [NSURL URLWithString:@"https://www.cypanthers.org/ios/auth.php"];
        
        //initialize a request from url
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
        
        //set http method
        [request setHTTPMethod:@"POST"];
        //initialize a post data
        NSString *postData = [NSString stringWithFormat:@"username=%@&password=%@&apikey=dFCbdEVD8apyvMEX", username, password];
        //set request content type we MUST set this value.
        
        [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        //set post data of request
        [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
        
        //initialize a connection from request
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        self.connection = connection;
        //[connection release];
        
        //start the connection
        [connection start];
    
    
    
    if([username isEqualToString:@"na8XUkXcwKGYfGF6LKtSSSCR"]){
        if ([password isEqualToString:@"YENknw2kqCLKx6WeLq64XTwL"]) {
            [self performSegueWithIdentifier: @"Admin" sender: self];
        }
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    }
}

/*
 this method might be calling more than one times according to incoming data size
 */
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.receivedData appendData:data];
    
}
/*
 if there is an error occured, this method will be called by connection
 */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"%@" , error);
}

/*
 if data is successfully received, this method will be called by connection
 */
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    //initialize convert the received data to string with UTF8 encoding
    NSString *htmlSTR = [[NSString alloc] initWithData:self.receivedData
                                              encoding:NSUTF8StringEncoding];
    NSLog(@"%@" , htmlSTR);
    
    if([htmlSTR isEqualToString:@"1"]){
        NSLog(@"Data Correct");
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"CONFIRMED"];
        
    }
    else{
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"CONFIRMED"];
        //_loggedInButton.text = @"Incorrect Login";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incorrect Login"
                                                        message:@"Please log in again"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    //initialize a new webviewcontroller
    // WebViewController *controller = [[WebViewController alloc] initWithString:htmlSTR];
    
    //show controller with navigation
    //[self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)libraryPressed:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:@"Library" forKey:@"Background"];
    _LibraryActivity.progress = 1;
    _outsideActivity.progress = 0;
    _lobbyActivity.progress = 0;
    NSLog(@"Library Pressed");
}

- (IBAction)outsidePressed:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:@"Outside" forKey:@"Background"];
    _LibraryActivity.progress = 0;
    _outsideActivity.progress = 1;
    _lobbyActivity.progress = 0;
}
- (IBAction)roofPressed:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:@"Roof" forKey:@"Background"];
    _LibraryActivity.progress = 0;
    _outsideActivity.progress = 0;
    _lobbyActivity.progress = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    NSString *backgroundType = [[NSUserDefaults standardUserDefaults] objectForKey:@"Background"];
    
    if([backgroundType isEqualToString:@"Library"]){
        UIImage *image1 = [UIImage imageNamed: @"Library.png"];
        _LibraryActivity.progress = 1;
        _outsideActivity.progress = 0;
        NSLog(@"background 1");
    }
    if([backgroundType isEqualToString:@"Outside"]){
        UIImage *image2 = [UIImage imageNamed: @"outside.png"];
        _LibraryActivity.progress = 0;
        _outsideActivity.progress = 1;
        NSLog(@"background 2");
        
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
