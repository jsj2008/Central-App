//
//  popOverViewController.h
//  Central
//
//  Created by Caleb Linburg on 2/11/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface popOverViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *lunchText;
@property (weak, nonatomic) IBOutlet UILabel *clcText;
@property (weak, nonatomic) IBOutlet UILabel *period1Text;
@property (weak, nonatomic) IBOutlet UILabel *period2Text;
@property (weak, nonatomic) IBOutlet UILabel *period3Text;
@property (weak, nonatomic) IBOutlet UILabel *lunchAText;
@property (weak, nonatomic) IBOutlet UILabel *lunchBtext;
@property (weak, nonatomic) IBOutlet UILabel *lunchCText;
@property (weak, nonatomic) IBOutlet UILabel *lunchDText;
@property (weak, nonatomic) IBOutlet UILabel *period4Text;
@property (weak, nonatomic) IBOutlet UILabel *flexText;
@property (strong, nonatomic) IBOutlet UIButton *homepageButton;
@property (strong, nonatomic) IBOutlet UILabel *scheduleText;


@end
