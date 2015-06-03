//
//  Four_Upstairs_ViewController.m
//  Central Map
//
//  Created by Alex Santarelli on 1/8/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

#import "Four_Upstairs_ViewController.h"

@interface Four_Upstairs_ViewController ()

@end

@implementation Four_Upstairs_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.FourUTeacher.text = @"";
    self.FourURoom.text = @"";
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

- (NSUInteger) supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskLandscape;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Four18:(id)sender {
    self.FourUTeacher.text = @"Special Education";
    self.FourURoom.text = @"418";
}

- (IBAction)Four19:(id)sender {
    self.FourUTeacher.text = @"Dickmyer";
    self.FourURoom.text = @"419";
}

- (IBAction)Four20:(id)sender {
    self.FourUTeacher.text = @"Stormes";
    self.FourURoom.text = @"420";
}

- (IBAction)Four21:(id)sender {
    self.FourUTeacher.text = @"Hakim";
    self.FourURoom.text = @"421";
}

- (IBAction)Four22:(id)sender {
    self.FourUTeacher.text = @"Biechler";
    self.FourURoom.text = @"422";
}

- (IBAction)Four23:(id)sender {
    self.FourUTeacher.text = @"Monahan";
    self.FourURoom.text = @"423";
}

- (IBAction)Four24:(id)sender {
    self.FourUTeacher.text = @"Kelly";
    self.FourURoom.text = @"424";
}

- (IBAction)Four25:(id)sender {
    self.FourUTeacher.text = @"Schieler";
    self.FourURoom.text = @"425";
}

- (IBAction)Four26:(id)sender {
    self.FourUTeacher.text = @"Hersey";
    self.FourURoom.text = @"426";
}

- (IBAction)Four27:(id)sender {
    self.FourUTeacher.text = @"Peterson";
    self.FourURoom.text = @"427";
}

- (IBAction)Four28:(id)sender {
    self.FourUTeacher.text = @"Sands";
    self.FourURoom.text = @"428";
}

- (IBAction)Four29:(id)sender {
    self.FourUTeacher.text = @"Gibson";
    self.FourURoom.text = @"429";
}

- (IBAction)Four30:(id)sender {
    self.FourUTeacher.text = @"DuBose";
    self.FourURoom.text = @"430";
}
@end
