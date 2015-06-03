//
//  DownstairsViewController.m
//  Central
//
//  Created by Caleb Linburg on 1/15/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import "DownstairsViewController.h"
#import "AppDelegate.h"


@interface DownstairsViewController ()

@end


@implementation DownstairsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    //This is depricated in iOS 8
    //But Apple will allow because 8 doesnt have a lock in command
    
    if ([[UIScreen mainScreen] bounds].size.height > [[UIScreen mainScreen] bounds].size.width) {
        if (self.interfaceOrientation != UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation != UIInterfaceOrientationLandscapeRight) {
            [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:") withObject:(__bridge id)((void*)UIInterfaceOrientationLandscapeRight)];
        }
    }

    [self supportedInterfaceOrientations];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    if (size.height > size.width) {
        if (self.interfaceOrientation != UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation != UIInterfaceOrientationLandscapeRight) {
            [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:") withObject:(__bridge id)((void*)UIInterfaceOrientationLandscapeRight)];
        }
    }
}

- (IBAction)upstairsPressed:(id)sender {
    
}

- (IBAction)homePressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
