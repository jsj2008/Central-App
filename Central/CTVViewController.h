//
//  CTVViewController.h
//  Central
//
//  Created by Caleb Linburg on 8/28/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTVViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *CTVWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
