//
//  FLEXViewController.h
//  Central
//
//  Created by Caleb Linburg on 8/19/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLEXViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *FLEXWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
