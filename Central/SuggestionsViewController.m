//
//  SuggestionsViewController.m
//  Central
//
//  Created by Caleb Linburg on 9/6/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import "SuggestionsViewController.h"
#import "Parse/Parse.h"

@interface SuggestionsViewController ()

@end

@implementation SuggestionsViewController

- (IBAction)sendPressed:(id)sender {
    NSString *text = _textView.text;
    NSString *savedUsername = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERNAME"];
    
    PFObject *userSuggestions = [PFObject objectWithClassName:@"Suggestions"];
    userSuggestions[@"Entry"] = text;
    userSuggestions[@"Username"] = savedUsername;
    [userSuggestions saveInBackground];
    
    _saved.text = @"Saved";
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hideSaved) userInfo:nil repeats:NO];
    
    _textView.text = @"";
}

- (void)hideSaved {
    _saved.text = @"";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _textView.text = @"";
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
