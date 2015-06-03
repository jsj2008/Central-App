//
//  Five_Downstairs_ViewController.m
//  Central Map
//
//  Created by Alex Santarelli on 1/6/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

#import "Five_Downstairs_ViewController.h"

@interface Five_Downstairs_ViewController ()

@end

@implementation Five_Downstairs_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.FiveDTeacher.text = @"";
    self.FiveDRoom.text = @"";
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

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape + UIInterfaceOrientationMaskLandscapeLeft + UIInterfaceOrientationMaskLandscapeRight;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)Five_One:(id)sender {
    self.FiveDTeacher.text = @"Ponas";
    self.FiveDRoom.text = @"501";
}

- (IBAction)Five_two:(id)sender {
    self.FiveDTeacher.text = @"Eisenbeil";
    self.FiveDRoom.text = @"502";
}

- (IBAction)Five_Three:(id)sender {
    self.FiveDTeacher.text = @"Hudson";
    self.FiveDRoom.text = @"503";
}

- (IBAction)Five_Four:(id)sender {
    self.FiveDTeacher.text = @"Kedney";
    self.FiveDRoom.text = @"504";
}

- (IBAction)Five_Five:(id)sender {
    self.FiveDTeacher.text = @"Anderson";
    self.FiveDRoom.text = @"505";
}

- (IBAction)Five_six:(id)sender {
    self.FiveDTeacher.text = @"Daniels";
    self.FiveDRoom.text = @"506";
}

- (IBAction)Five_Seven:(id)sender {
    self.FiveDTeacher.text = @"Mrs.Detwiler";
    self.FiveDRoom.text = @"507";
}

- (IBAction)Five_Eight:(id)sender {
    self.FiveDTeacher.text = @"Grogg";
    self.FiveDRoom.text = @"508";
}

- (IBAction)Five_Nine:(id)sender {
    self.FiveDTeacher.text = @"Mr.Detwiler";
    self.FiveDRoom.text = @"509";
}

- (IBAction)Five_Ten:(id)sender {
    self.FiveDTeacher.text = @"Turner";
    self.FiveDRoom.text = @"510";
}

- (IBAction)Five_Eleven:(id)sender {
    self.FiveDTeacher.text = @"Webb";
    self.FiveDRoom.text = @"511";
}

- (IBAction)Five_Twelve:(id)sender {
    self.FiveDTeacher.text = @"Hicks";
    self.FiveDRoom.text = @"512";
}

- (IBAction)Five_Thirteen:(id)sender {
    self.FiveDTeacher.text = @"Fairman";
    self.FiveDRoom.text = @"513";
}

- (IBAction)dellicarpini:(id)sender {
    self.FiveDTeacher.text = @"Dellicarpini";
    self.FiveDRoom.text = @"514";
}

- (IBAction)Five_Fifteen:(id)sender {
    self.FiveDTeacher.text = @"Bushey";
    self.FiveDRoom.text = @"515";
}

- (IBAction)Five_seventeen:(id)sender {
    self.FiveDTeacher.text = @"Jansen";
    self.FiveDRoom.text = @"517";
}

- (IBAction)rafferty:(id)sender {
    self.FiveDTeacher.text = @"Rafferty";
    self.FiveDRoom.text = @"516";
}

- (IBAction)Five_Eighteen:(id)sender {
    self.FiveDTeacher.text = @"Beinhower";
    self.FiveDRoom.text = @"518";
}

- (IBAction)Five_Nineteen:(id)sender {
    self.FiveDTeacher.text = @"Rodland";
    self.FiveDRoom.text = @"519";
}

- (IBAction)Five_Twenty:(id)sender {
    self.FiveDTeacher.text = @"Barkus";
    self.FiveDRoom.text = @"520";
}

- (IBAction)Five_TwentyOne:(id)sender {
    self.FiveDTeacher.text = @"Trimmer";
    self.FiveDRoom.text = @"521";
}

- (IBAction)Five_TwentyTwo:(id)sender {
    self.FiveDTeacher.text = @"Hess";
    self.FiveDRoom.text = @"522";
}
@end
