//
//  AdminViewController.h
//  Central
//
//  Created by Caleb Linburg on 9/8/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>
@import LocalAuthentication;

@interface AdminViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UITextField *passTextView;
@end
