//
//  popOverViewController.m
//  Central
//
//  Created by Caleb Linburg on 2/11/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import "popOverViewController.h"
#import "Parse/Parse.h"
@interface popOverViewController ()

@end

@implementation popOverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
   /* PFObject *lunchObject = [PFObject objectWithClassName:@"Schedule"];
    lunchObject[@"Type"] = @"Normal";
    [lunchObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];*/
    
    PFQuery *Textquery = [PFQuery queryWithClassName:@"LunchText"];
    [Textquery getObjectInBackgroundWithId:@"TyiebjkJH8" block:^(PFObject *lunchTextObject, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", lunchTextObject);
        
        NSString *lunchString = [lunchTextObject objectForKey:@"Text"] ;
        
        _lunchText.text = lunchString;
       [_lunchText setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15]];
        //[_lunchText setFont:[UIFont systemFontOfSize:22]];
        //[timedisplayLabel setFont:[UIFont fontWithName:@"digital-7" size:60]];
    }];
    
    PFQuery *scheduleQuery = [PFQuery queryWithClassName:@"Schedule"];
    [scheduleQuery getObjectInBackgroundWithId:@"wBRDokk7yt" block:^(PFObject *scheduleObject, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", scheduleObject);
        
        NSString *scheduleString = [scheduleObject objectForKey:@"Type"] ;

        if([scheduleString isEqualToString:@"Normal"]){
            _clcText.text = @"CLC - 7:45-8:00";
            _period1Text.text = @"Period 1 - 8:04-9:21";
            _period2Text.text = @"Period 2 - 9:25-10:42";
            _period3Text.text = @"Period 3 - 10:46-12:42";
                _lunchAText.text = @"Lunch A- 10:42-11:12";
                _lunchBtext.text = @"Lunch B- 11:12-11:42";
                _lunchCText.text = @"Lunch C- 11:42-12:12";
                _lunchDText.text = @"Lunch D- 12:12-12:42";
            _period4Text.text = @"Period 4 - 12:46-2:03";
            _flexText.text = @"FLEX - 2:07-2:40";
        }
        else if ([scheduleString isEqualToString:@"1Hour"]){
            _clcText.text = @"No CLC";
            _period1Text.text = @"Period 1 - 8:45-10:01";
            _period2Text.text = @"Period 2 - 10:05-11:21";
            _period3Text.text = @"Period 3 - 11:25-1:21";
            _lunchAText.text = @"Lunch A- 11:21-11:51";
            _lunchBtext.text = @"Lunch B- 11:51-12:21";
            _lunchCText.text = @"Lunch C- 12:21-12:51";
            _lunchDText.text = @"Lunch D- 12:51-1:21";
            _period4Text.text = @"Period 4 - 1:25-2:40";
            _flexText.text = @"NO FLEX";
        }
        else if ([scheduleString isEqualToString:@"2Hour"]){
            _clcText.text = @"No CLC";
            _period1Text.text = @"Period 1 - 9:45-10:41";
            _period2Text.text = @"Period 2 - 10:45-11:41";
            _period3Text.text = @"Period 3 - 11:45-1:41";
            _lunchAText.text = @"Lunch A- 11:41-12:11";
            _lunchBtext.text = @"Lunch B- 12:11-12:41";
            _lunchCText.text = @"Lunch C- 12:41-1:11";
            _lunchDText.text = @"Lunch D- 1:11-1:41";
            _period4Text.text = @"Period 4 - 1:45-2:40";
            _flexText.text = @"NO FLEX";
        }
        else if ([scheduleString isEqualToString:@"Half"]){
            _clcText.text = @"No CLC";
            _period1Text.text = @"Period 1 - 7:45-8:41";
            _period2Text.text = @"Period 2 - 8:45-9:36";
            _period3Text.text = @"Period 3 - 9:40-10:31";
            _lunchAText.text = @"No Lunch";
            _lunchBtext.text = @"No Lunch";
            _lunchCText.text = @"No Lunch";
            _lunchDText.text = @"No Lunch";
            _period4Text.text = @"Period 4 - 10:35-11:30";
            _flexText.text = @"No FLEX";
        }
        else{
            _clcText.text = @"";
            _period1Text.text = @"";
            _period2Text.text = @"";
            _period3Text.text = @"";
            _lunchAText.text = @"";
            _lunchBtext.text = @"";
            _lunchCText.text = @"";
            _lunchDText.text = @"";
            _period4Text.text = @"";
            _flexText.text = @"";
        }
        
    }];
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        
    }
    else{
        NSLog(@"Else");
        self.homepageButton.center = CGPointMake( [[UIScreen mainScreen ] bounds ].size.width/2, 450);
        _scheduleText.hidden = YES;
        _clcText.hidden = YES;
        _period1Text.hidden = YES;
        _period2Text.hidden = YES;
        _period3Text.hidden = YES;
        _lunchAText.hidden = YES;
        _lunchBtext.hidden = YES;
        _lunchCText.hidden = YES;
        _lunchDText.hidden = YES;
        _period4Text.hidden = YES;
        _flexText.hidden = YES;
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

@end
