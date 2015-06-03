//
//  iPhoneOpenViewController.h
//  Central
//
//  Created by Caleb Linburg on 1/29/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPhoneOpenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameBlank;
@property (weak, nonatomic) IBOutlet UITextField *passwordBlank;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *doneSkipButton;

@end
