//
//  OnlineGradesViewController.h
//  Central
//
//  Created by Caleb Linburg on 8/15/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnlineGradesViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *gradesWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
