//
//  Six_Downstairs_ViewController.m
//  Central Map
//
//  Created by Alex Santarelli on 1/6/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

#import "Six_Downstairs_ViewController.h"

@interface Six_Downstairs_ViewController ()

@end

@implementation Six_Downstairs_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.SixDTeacher.text = @"";
    self.SixDRoom.text = @"";
    // Do any additional setup after loading the view.
    //This is depricated in iOS 8
    //But Apple will allow because 8 doesnt have a lock in command
    if ([[UIScreen mainScreen] bounds].size.height > [[UIScreen mainScreen] bounds].size.width) {

    if (self.interfaceOrientation != UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation != UIInterfaceOrientationLandscapeRight) {
        [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:") withObject:(__bridge id)((void*)UIInterfaceOrientationLandscapeRight)];
    }
    }
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    if (size.height > size.width) {
        if (self.interfaceOrientation != UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation != UIInterfaceOrientationLandscapeRight) {
            [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:") withObject:(__bridge id)((void*)UIInterfaceOrientationLandscapeRight)];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Six0One:(id)sender {
    self.SixDTeacher.text = @"Everett";
    self.SixDRoom.text = @"601";
}

- (IBAction)Six0Two:(id)sender {
    self.SixDTeacher.text = @"Blasetti";
    self.SixDRoom.text = @"602";
}

- (IBAction)Six0Three:(id)sender {
    self.SixDTeacher.text = @"Ressel";
    self.SixDRoom.text = @"603";
}

- (IBAction)Six0Four:(id)sender {
    self.SixDTeacher.text = @"Musselman";
    self.SixDRoom.text = @"604";
}

- (IBAction)Six0Five:(id)sender {
    self.SixDTeacher.text = @"Godziejewski";
    self.SixDRoom.text = @"605";
}

- (IBAction)Six0Six:(id)sender {
    self.SixDTeacher.text = @"PLTW Lab";
    self.SixDRoom.text = @"606";
}

- (IBAction)Six0Seven:(id)sender {
    self.SixDTeacher.text = @"Calix";
    self.SixDRoom.text = @"607";
}

- (IBAction)Six0Eight:(id)sender {
    self.SixDTeacher.text = @"Thompson";
    self.SixDRoom.text = @"608";
}

- (IBAction)Six0Nine:(id)sender {
    self.SixDTeacher.text = @"Menges";
    self.SixDRoom.text = @"609";
}

- (IBAction)SixTen:(id)sender {
    self.SixDTeacher.text = @"Musselman";
    self.SixDRoom.text = @"610";
}

- (IBAction)SixEleven:(id)sender {
    self.SixDTeacher.text = @"Wert";
    self.SixDRoom.text = @"611";
}
@end
