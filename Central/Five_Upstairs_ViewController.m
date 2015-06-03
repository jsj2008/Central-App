//
//  Five_Upstairs_ViewController.m
//  Central Map
//
//  Created by Alex Santarelli on 1/8/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

#import "Five_Upstairs_ViewController.h"

@interface Five_Upstairs_ViewController ()

@end

@implementation Five_Upstairs_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.FiveUTeacher.text = @"";
    self.FiveURoom.text = @"";
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

- (IBAction)Five28:(id)sender {
    self.FiveUTeacher.text = @"Kocul";
    self.FiveURoom.text = @"528";
}

- (IBAction)Five29:(id)sender {
    self.FiveUTeacher.text = @"Goodrich";
    self.FiveURoom.text = @"529";
}

- (IBAction)Five30:(id)sender {
    self.FiveUTeacher.text = @"Lutz";
    self.FiveURoom.text = @"530";
}

- (IBAction)Five31:(id)sender {
    self.FiveUTeacher.text = @"Ford";
    self.FiveURoom.text = @"531";
}

- (IBAction)Five32:(id)sender {
    self.FiveUTeacher.text = @"White";
    self.FiveURoom.text = @"532";
}

- (IBAction)Five33:(id)sender {
    self.FiveUTeacher.text = @"Barnett";
    self.FiveURoom.text = @"533";
}

- (IBAction)Five34:(id)sender {
    self.FiveUTeacher.text = @"Shive";
    self.FiveURoom.text = @"534";
}

- (IBAction)Five35:(id)sender {
    self.FiveUTeacher.text = @"Jacobs";
    self.FiveURoom.text = @"535";
}

- (IBAction)Five36:(id)sender {
    self.FiveUTeacher.text = @"Grassel";
    self.FiveURoom.text = @"536";
}

- (IBAction)Five37:(id)sender {
    self.FiveUTeacher.text = @"McDaniel";
    self.FiveURoom.text = @"537";
}

- (IBAction)Five38:(id)sender {
    self.FiveUTeacher.text = @"Williams";
    self.FiveURoom.text = @"538";
}

- (IBAction)Five39:(id)sender {
    self.FiveUTeacher.text = @"Hoke";
    self.FiveURoom.text = @"539";
}

- (IBAction)Five40:(id)sender {
    self.FiveUTeacher.text = @"Reynolds";
    self.FiveURoom.text = @"540";
}

- (IBAction)Five41:(id)sender {
    self.FiveUTeacher.text = @"Linz";
    self.FiveURoom.text = @"541";
}

- (IBAction)Five42:(id)sender {
    self.FiveUTeacher.text = @"Carbaugh";
    self.FiveURoom.text = @"542";
}

- (IBAction)Five43:(id)sender {
    self.FiveUTeacher.text = @"LaPila";
    self.FiveURoom.text = @"543";
}

- (IBAction)Five44:(id)sender {
    self.FiveUTeacher.text = @"O'Brien";
    self.FiveURoom.text = @"544";
}

- (IBAction)Five45:(id)sender {
    self.FiveUTeacher.text = @"Mr.Lucia";
    self.FiveURoom.text = @"545";
}

- (IBAction)Five46:(id)sender {
    self.FiveUTeacher.text = @"Mrs.Lucia";
    self.FiveURoom.text = @"546";
}

- (IBAction)Five47:(id)sender {
    self.FiveUTeacher.text = @"Dohner";
    self.FiveURoom.text = @"547";
}

- (IBAction)Five48:(id)sender {
    self.FiveUTeacher.text = @"Saylor";
    self.FiveURoom.text = @"548";
}

- (IBAction)Five49:(id)sender {
    self.FiveUTeacher.text = @"Weisz";
    self.FiveURoom.text = @"549";
}


@end
