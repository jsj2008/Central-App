//
//  HomepageViewController.h
//  Central
//
//  Created by Caleb Linburg on 8/31/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomepageViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
