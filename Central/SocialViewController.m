//
//  SocialViewController.m
//  Central
//
//  Created by Caleb Linburg on 1/18/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import "SocialViewController.h"

@interface SocialViewController ()

@end

@implementation SocialViewController

- (IBAction)twitterPresed:(id)sender {
    
    NSURL *urlApp = [NSURL URLWithString: [NSString stringWithFormat:@"%@", @"twitter:///user?screen_name=centralyorksd"]];
                                           
    if([[UIApplication sharedApplication] canOpenURL:urlApp]){
        
        [[UIApplication sharedApplication] openURL:urlApp];
        
    }
    else{
         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/centralyorksd"]];
    }

}

- (IBAction)facebookPressed:(id)sender {
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/CentralYorkSD"]];
}
- (IBAction)phonePressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:7178466789"]];
}
- (IBAction)emailPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:hstips@cysd.k12.pa.us"]];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
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
