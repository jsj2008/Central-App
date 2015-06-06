//
//  ViewController.m
//  Central
//
//  Created by Caleb Linburg on 8/15/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import "ViewController.h"
#import "Parse/Parse.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController


/*
- (IBAction)livePressed:(id)sender {
    NSLog(@"Live Pressed");

 //doo stuff



}
NO LONGER VALID IN SWIFT
- (void)appDidBecomeActive:(NSNotification *)notification {
    NSLog(@"did become active notification");
    PFQuery *query = [PFQuery queryWithClassName:@"Settings"];
    [query getObjectInBackgroundWithId:@"iNe0Z29cBj" block:^(PFObject *isLiveNow, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", isLiveNow);

        NSString *buttonString = [isLiveNow objectForKey:@"LiveFeed"] ;

        if([buttonString isEqual:@"ON"]){
            _liveButton.hidden = NO;
        }
        else{
            _liveButton.hidden = YES;
        }

    }];
}

*/
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


    //USELESS
    /*
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
     */
    //parse stuff
    //used for live now button
    PFQuery *query = [PFQuery queryWithClassName:@"Settings"];
    [query getObjectInBackgroundWithId:@"iNe0Z29cBj" block:^(PFObject *isLiveNow, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", isLiveNow);

        NSString *buttonString = [isLiveNow objectForKey:@"LiveFeed"] ;

        if([buttonString isEqual:@"ON"]){
            _liveButton.hidden = NO;
        }
        else{
            _liveButton.hidden = YES;
        }

    }];

    /* NOT SEARCHING FOR TEXT BECAUSE THERE IS NO MORE TEXT OBJECT ANYMORE
    PFQuery *Textquery = [PFQuery queryWithClassName:@"ErrorLabel"];
    [Textquery getObjectInBackgroundWithId:@"B3di6piP6s" block:^(PFObject *isHelpText, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", isHelpText);

        NSString *HelpText = [isHelpText objectForKey:@"ON"] ;

        NSLog(HelpText);
        if([HelpText isEqual:@"ON"]){
            //_liveButton.hidden = NO;
            _textLabel.text = [isHelpText objectForKey:@"TEXT"];
            NSLog(@"IF STATEMENT");
        }
        else{
            //_liveButton.hidden = YES;
            _textLabel.text = @"";
            NSLog(@"ELSE STATEMENT");
        }

    }];


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];

    //called if 4 inch screen vs 3.5
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){


    }
   else{
       NSLog(@"Else");
      self.settingsButton.center = CGPointMake(25, 90);
    }
    */
    //initial app startup
    NSUserDefaults *standardUserDefaults = [[NSUserDefaults alloc] init];

    NSString *isOpened = [[NSUserDefaults standardUserDefaults] objectForKey:@"OPEN"];

    if(![isOpened isEqualToString:@"Opened"]){

        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
         [self performSegueWithIdentifier:@"Open" sender:self];
        }

    }//end of if


    [[NSUserDefaults standardUserDefaults] setObject:@"Opened" forKey:@"OPEN"];

}

-(void)viewWillAppear:(BOOL)animated{

    /* NOT PULLING THE FEED ANYMORE
    //Pull parse url for rss feed
    PFQuery *query = [PFQuery queryWithClassName:@"RSSFeed"];
    [query getObjectInBackgroundWithId:@"UjL2taFvJm" block:^(PFObject *currentURL, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", currentURL);

        //NSString *URLString = [myURL objectForKey:@"LiveFeed"] ;
        NSString *rssFeedURL = currentURL[@"RSSURL"];
        NSLog(@"String: %@", rssFeedURL);

        [[NSUserDefaults standardUserDefaults] setObject:rssFeedURL forKey:@"RSSURL"];




    }];
    USELESS AND REDUNDANT
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate setShouldRotate:NO];

    */

    NSString *backgroundType = [[NSUserDefaults standardUserDefaults] objectForKey:@"Background"];

    if([backgroundType isEqualToString:@"Library"]){
        UIImage *image1 = [UIImage imageNamed: @"Library.png"];
        [_backgroundView setImage:image1];
        NSLog(@"background 1");
    }
    if([backgroundType isEqualToString:@"Outside"]){
        UIImage *image2 = [UIImage imageNamed: @"outside.png"];
        [_backgroundView setImage:image2];

        NSLog(@"background 2");
    }

    if([backgroundType isEqualToString:@"Roof"]){
        UIImage *image3 = [UIImage imageNamed: @"roof_done.png"];
        [_backgroundView setImage:image3];

        NSLog(@"background 3");
    }



}

/* FROM HERE DOWN IS UNNESSECARY AND REDUNDANT
- (IBAction)touchDragOut:(id)sender {
    [self performSegueWithIdentifier:@"Homepage"
                              sender:self];

}




-(void)viewDidAppear:(BOOL)animated{

}
- (IBAction)iPhoneLogoPressed:(id)sender {

}
- (IBAction)iPhoneLogoTouchOut:(id)sender {
    [self performSegueWithIdentifier:@"iPhoneHomepage"
                              sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) orientationChanged:(NSNotification *)note
{
    UIDevice * device = note.object;
    switch(device.orientation)
    {
        case UIDeviceOrientationPortrait:
            self.view = self.portrait;
            NSLog(@"Portrait");
            break;

        case UIDeviceOrientationPortraitUpsideDown:
            self.view = self.landscape;
            NSLog(@"Landscape");
            break;

        default:
            break;
    };
}
*/
//Old Parse Password iPhone5SandiPhone6Plus

@end
