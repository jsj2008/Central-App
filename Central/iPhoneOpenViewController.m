//
//  iPhoneOpenViewController.m
//  Central
//
//  Created by Caleb Linburg on 1/29/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import "iPhoneOpenViewController.h"
#import "Parse/Parse.h"

@interface iPhoneOpenViewController ()

@end

@implementation iPhoneOpenViewController


- (IBAction)doneSkipPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)homePressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    //[self performSegueWithIdentifier:@"Home" sender:self];
}
- (IBAction)skipPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    //[self performSegueWithIdentifier:@"Home" sender:self];
}

- (IBAction)savePressed:(id)sender {
    NSUserDefaults *standardUserDefaults = [[NSUserDefaults alloc] init];
    
    
    [[NSUserDefaults standardUserDefaults] setObject:_usernameBlank.text forKey:@"USERNAME"];
    [[NSUserDefaults standardUserDefaults] setObject:_passwordBlank.text forKey:@"PASSWORD"];
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"USERNAME"]) {
        _usernameBlank.hidden = NO;
        _passwordBlank.hidden = NO;
        //_usernameLabel.hidden = NO;
        //_passwordLabel.hidden = NO;
        
    } else {
        _usernameBlank.hidden = YES;
        _passwordBlank.hidden = YES;
        // _usernameLabel.hidden = YES;
        //_passwordLabel.hidden = YES;
    }
    
    
    NSString *username = _usernameBlank.text;
    NSString *password = _passwordBlank.text;
    
    if(![username isEqualToString:@""]){
        
    }
    else{
        NSLog(@"Blank Username");
    }
    
    NSString *classYear = [username substringToIndex:2];
    NSString *newUsername = [NSString stringWithFormat:@"U%@", username];
    NSString *newClassYear = [NSString stringWithFormat:@"C%@", classYear];
    
    // NSLog(classYear);
    
    //clear all channels
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    currentInstallation.channels = [NSArray array];
    [currentInstallation saveEventually];
    
    //add channels
    [currentInstallation addUniqueObject:newClassYear forKey:@"channels"];
    [currentInstallation addUniqueObject:newUsername forKey:@"channels"];
    [currentInstallation saveInBackground];
    
    
    
    
    
    
    if([username isEqualToString:@"na8XUkXcwKGYfGF6LKtSSSCR"]){
        if ([password isEqualToString:@"YENknw2kqCLKx6WeLq64XTwL"]) {
            [self performSegueWithIdentifier: @"Admin" sender: self];
        }
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}



-(void)viewWillAppear:(BOOL)animated{

    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
