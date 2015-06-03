//
//  StreamViewController.m
//  Central
//
//  Created by Caleb Linburg on 11/12/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import "StreamViewController.h"
#import "Parse/Parse.h"

@interface StreamViewController ()

@end

@implementation StreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _webView.delegate = self;
    NSString *myURLString = @"";
    
    PFQuery *query = [PFQuery queryWithClassName:@"Settings"];
    [query getObjectInBackgroundWithId:@"iNe0Z29cBj" block:^(PFObject *myURL, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", myURL);
        
        //NSString *URLString = [myURL objectForKey:@"LiveFeed"] ;
        NSString *URLString = myURL[@"LiveURL"];
        NSLog(@"String: %@", URLString);
        
        self.webView.delegate = self;
        
        NSString *urlAddress = URLString;
        //Create a URL object.
        NSURL *url = [NSURL URLWithString:urlAddress];
        //URL Requst Object
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        //Load the request in the UIWebView.
        [_webView loadRequest:requestObj];
        
       
        
    }];
    
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    // Not necessary to do anything here.
    _activityIndicator.startAnimating;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
       NSLog(@"Loaded Sucessfully!");
    _activityIndicator.stopAnimating;
    _activityIndicator.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
