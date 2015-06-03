//
//  Six_Upstairs_ViewController.m
//  Central Map
//
//  Created by Alex Santarelli on 1/8/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

#import "Six_Upstairs_ViewController.h"

@interface Six_Upstairs_ViewController ()

@end

@implementation Six_Upstairs_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.SixUTeacher.text = @"";
    self.SixURoom.text = @"";
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

- (IBAction)Six20:(id)sender {
    self.SixUTeacher.text = @"Guise";
    self.SixURoom.text = @"620";
}

- (IBAction)Six21:(id)sender {
    self.SixUTeacher.text = @"Howard";
    self.SixURoom.text = @"621";
}

- (IBAction)Six22:(id)sender {
    self.SixUTeacher.text = @"Wilke";
    self.SixURoom.text = @"622";
}

- (IBAction)Six23:(id)sender {
    self.SixUTeacher.text = @"Francis";
    self.SixURoom.text = @"623";
}

- (IBAction)Six24:(id)sender {
    self.SixUTeacher.text = @"Walter";
    self.SixURoom.text = @"624";
}

- (IBAction)Six25:(id)sender {
    self.SixUTeacher.text = @"Wertz";
    self.SixURoom.text = @"625";
}

- (IBAction)Six26:(id)sender {
    self.SixUTeacher.text = @"Wimmer";
    self.SixURoom.text = @"626";
}

- (IBAction)Six27:(id)sender {
    self.SixUTeacher.text = @"Kazi";
    self.SixURoom.text = @"627";
}

- (IBAction)Six28:(id)sender {
    self.SixUTeacher.text = @"Ward";
    self.SixURoom.text = @"628";
}

- (IBAction)Six29:(id)sender {
    self.SixUTeacher.text = @"Walker";
    self.SixURoom.text = @"629";
}

- (IBAction)Six30:(id)sender {
    self.SixUTeacher.text = @"Grandi";
    self.SixURoom.text = @"630";
}

- (IBAction)Six31:(id)sender {
    self.SixUTeacher.text = @"Shumway";
    self.SixURoom.text = @"631";
}


@end
