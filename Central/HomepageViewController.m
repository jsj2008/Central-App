//
//  HomepageViewController.m
//  Central
//
//  Created by Caleb Linburg on 8/31/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import "HomepageViewController.h"

@interface HomepageViewController ()

@end

@implementation HomepageViewController


- (void)viewDidLoad
{
    
    //self.CTVWebView.delegate = self;
    _webView.delegate = self;


    NSString *urlAddress = @"http://hs.cysd.k12.pa.us";
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //Load the request in the UIWebView.
    [_webView loadRequest:requestObj];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
