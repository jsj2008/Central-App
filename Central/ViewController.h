//
//  ViewController.h
//  Central
//
//  Created by Caleb Linburg on 8/15/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *liveButton;
@property (strong, nonatomic) IBOutlet UIView *landscape;
@property (strong, nonatomic) IBOutlet UIView *portrait;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *iPhoneLogo;


@end
