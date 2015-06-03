//
//  Four_Downstairs_ViewController.m
//  Central Map
//
//  Created by Alex Santarelli on 1/6/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

#import "Four_Downstairs_ViewController.h"

@interface Four_Downstairs_ViewController ()

@end

@implementation Four_Downstairs_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.FourDTeacher.text = @"";
    self.FourDRoom.text = @"";
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



- (IBAction)Four0Three:(id)sender {
    self.FourDTeacher.text = @"Culinary Lab";
    self.FourDRoom.text = @"403";
}

- (IBAction)Four0Four:(id)sender {
    self.FourDTeacher.text = @"Crump";
    self.FourDRoom.text = @"404";
}

- (IBAction)Four0Five:(id)sender {
    self.FourDTeacher.text = @"DeMarzo";
    self.FourDRoom.text = @"405";
}

- (IBAction)Four0Six:(id)sender {
    self.FourDTeacher.text = @"Tyson";
    self.FourDRoom.text = @"406";
}

- (IBAction)Four0Seven:(id)sender {
    self.FourDTeacher.text = @"King";
    self.FourDRoom.text = @"407";
}

- (IBAction)Four0Eight:(id)sender {
    self.FourDTeacher.text = @"Brudowsky";
    self.FourDRoom.text = @"408";
}

- (IBAction)Four0Nine:(id)sender {
    self.FourDTeacher.text = @"Wagner";
    self.FourDRoom.text = @"409";
}

- (IBAction)FourTen:(id)sender {
    self.FourDTeacher.text = @"Preschool";
    self.FourDRoom.text = @"410";
}

- (IBAction)FourEleven:(id)sender {
    self.FourDTeacher.text = @"Walker";
    self.FourDRoom.text = @"411";
}

- (IBAction)FourTwelve:(id)sender {
    self.FourDTeacher.text = @"Smith";
    self.FourDRoom.text = @"412";
}

- (IBAction)Four0Ten:(id)sender {
}
@end
