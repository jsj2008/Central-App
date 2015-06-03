//
//  CTVViewController.m
//  Central
//
//  Created by Caleb Linburg on 8/28/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import "CTVViewController.h"

@interface CTVViewController ()

@end

@implementation CTVViewController


- (void)viewDidLoad
{
    
    self.CTVWebView.delegate = self;
    
    NSString *urlAddress = @"http://www.cypanthers.org/ctv/";
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //Load the request in the UIWebView.
    [_CTVWebView loadRequest:requestObj];
    _activityIndicator.startAnimating;
    
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
