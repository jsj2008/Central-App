//
//  HelpViewController.m
//  Central
//
//  Created by Caleb Linburg on 8/31/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import "HelpViewController.h"
#import "Parse/Parse.h"

@interface HelpViewController ()

@end

@implementation HelpViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"helpText"];
    [query getObjectInBackgroundWithId:@"eeoEInrdHU" block:^(PFObject *helpText, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", helpText);
       NSString *helpTextString = [NSString stringWithFormat:@"%@", helpText];
        
        //get rid of extra parse.com garbage on string
        NSString *string = helpTextString;
        NSRange range = [string rangeOfString:@"\""];
        NSString *newString = [string substringFromIndex:range.location];
        newString = [newString stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        newString = [newString stringByReplacingOccurrencesOfString:@";" withString:@""];
        newString = [newString stringByReplacingOccurrencesOfString:@"}" withString:@""];
        newString = [newString stringByReplacingOccurrencesOfString:@"" withString:@""];

        


        
        _helpTextField.text = newString;
        
        [[NSUserDefaults standardUserDefaults] setObject:helpTextString forKey:@"helpText"];

    }];
    
    
    NSString *helpTextString1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"helpText"];
    _helpTextField.text = helpTextString1;


    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
