//
//  TechHelpViewController.m
//  Central
//
//  Created by Alex Santarelli on 1/16/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import "TechHelpViewController.h"

@interface TechHelpViewController ()

@end

@implementation TechHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"iTeam Webpage";
    self.techHelpWebView.delegate = self;
    NSString *urlAddressTechHelp = @"http://www.cypanthers.org/iteam/";
    NSURL *techAddressTechHelp = [NSURL URLWithString:urlAddressTechHelp];
    NSURLRequest *techHelpRequestObject = [NSURLRequest requestWithURL:techAddressTechHelp];
    [_techHelpWebView loadRequest:techHelpRequestObject];
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

@end
