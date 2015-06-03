//
//  FLEXViewController.m
//  Central
//
//  Created by Caleb Linburg on 8/19/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import "FLEXViewController.h"
#import <Parse/Parse.h>

@interface FLEXViewController ()

@end

@implementation FLEXViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.FLEXWebView.delegate = self;
    
    NSString *urlAddress = @"https://www.cypanthers.org/flex/";
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //Load the request in the UIWebView.
    [_FLEXWebView loadRequest:requestObj];
    //Tracking Analytics for How many people access the Flex View
    [PFAnalytics trackEvent:@"Flex View Opened"];
}


//Something to dop with making sure popups work
-(BOOL)FLEXWebView:(UIWebView *)mainWebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        //Allows for twitter links
        [self.FLEXWebView loadRequest:request];
        return NO;
    }
    
    return YES;
    
}


- (void)webViewDidFinishLoad:(UIWebView *)gradesWebView {
    
    _activityIndicator.stopAnimating;
    _activityIndicator.hidden = YES;
    
    NSLog(@"View completed loading");
    // Auto fill the username and password text fields, assuming the HTML has
    // <input type="text" name="username"> and
    // <input type="text" name="password">
    NSString *savedUsername = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERNAME"];
    NSString *savedPassword = [[NSUserDefaults standardUserDefaults] objectForKey:@"PASSWORD"];
    
    
    //pass the login Credintails into textfield of WebView.
    
    //str_Username_req
    //str_Password_req
    
    if (savedUsername.length != 0 && savedPassword.length != 0) {
        // Create js strings
        NSString *loadUsernameJS = [NSString stringWithFormat:@"var inputFields = document.querySelectorAll(\"input[name='txtuserName']\"); \
                                    for (var i = inputFields.length >>> 0; i--;) { inputFields[i].value = '%@';}", savedUsername];
        NSString *loadPasswordJS = [NSString stringWithFormat:@"var inputFields = document.querySelectorAll(\"input[name='txtPassword']\"); \
                                    for (var i = inputFields.length >>> 0; i--;) { inputFields[i].value = '%@';}", savedPassword];
        
        //not working
        NSString *performSubmitJS = @"var passFields = document.querySelectorAll(\"input[type='submit']\"); \
        passFields[0].click()";
        
        // Runs the JS
        [self.FLEXWebView stringByEvaluatingJavaScriptFromString: loadUsernameJS];
        [self.FLEXWebView stringByEvaluatingJavaScriptFromString: loadPasswordJS];
        
        //not working
        //[self.FLEXWebView stringByEvaluatingJavaScriptFromString: performSubmitJS];
        
       /* NSString *urlAddress = @"https://www.cypanthers.org/flex/student/get_day_activities";
        //Create a URL object.
        NSURL *url = [NSURL URLWithString:urlAddress];
        //URL Requst Object
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        //Load the request in the UIWebView.
        [_FLEXWebView loadRequest:requestObj]; */
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    // Not necessary to do anything here.
    NSLog(@"Started Loading");
    _activityIndicator.startAnimating;
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
