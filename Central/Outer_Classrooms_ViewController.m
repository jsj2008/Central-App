//
//  Outer_Classrooms_ViewController.m
//  Central Map
//
//  Created by Alex Santarelli on 1/10/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

#import "Outer_Classrooms_ViewController.h"

@interface Outer_Classrooms_ViewController ()

@end

@implementation Outer_Classrooms_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.OuterUTeacher.text = @"";
    self.OuterURoom.text = @"";
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

- (IBAction)One69:(id)sender {
    self.OuterUTeacher.text = @"Parido";
    self.OuterURoom.text = @"169";
}

- (IBAction)One71:(id)sender {
    self.OuterUTeacher.text = @"Carl";
    self.OuterURoom.text = @"171";
}

- (IBAction)One70:(id)sender {
    self.OuterUTeacher.text = @"Gibbs";
    self.OuterURoom.text = @"170";
}

- (IBAction)Six36:(id)sender {
    self.OuterUTeacher.text = @"Wilt";
    self.OuterURoom.text = @"636";
}

- (IBAction)Six37:(id)sender {
    self.OuterUTeacher.text = @"Cornbower";
    self.OuterURoom.text = @"637";
}

- (IBAction)Six38:(id)sender {
    self.OuterUTeacher.text = @"Kyle";
    self.OuterURoom.text = @"638";
}

- (IBAction)Six39:(id)sender {
    self.OuterUTeacher.text = @"Wachowski";
    self.OuterURoom.text = @"639";
}
@end
