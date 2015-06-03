//
//  HallPassViewController.m
//  Central
//
//  Created by Caleb Linburg on 3/11/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import "Parse/Parse.h"
#import "HallPassViewController.h"

@interface HallPassViewController (){

NSArray *pickerData;
}
@property int inOrOut;
@end

@implementation HallPassViewController

    - (void)viewDidLoad {
        [super viewDidLoad];
        
    
        
        _inOrOut = 0;
        
        UIImage *buttonImage = [UIImage imageNamed:@"switch2.png"];
        
        
        [_checkInOutButton setImage:buttonImage forState:UIControlStateNormal];
        
        
        [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
        
        NSString *savedUsername = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERNAME"];
        NSString *confirmed = [[NSUserDefaults standardUserDefaults] objectForKey:@"CONFIRMED"];

        if ([savedUsername isEqualToString:@""] || savedUsername == nil){
            NSLog(@"No username");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Not Logged In"
                                                            message:@"Please log in using the settings gear on the homepage"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [self.navigationController popViewControllerAnimated:YES];
           
        }
        if ([confirmed isEqualToString:@"NO"]){
            NSLog(@"Not confirmed");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incorrect Login"
                                                            message:@"Please log in again using the settings gear on the homepage. Note: Teachers are not able to use HallPass"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
        
        // Initialize Data
        pickerData = @[@"Bathroom", @"HUB", @"Nurse", @"Classroom", @"Guidance Office", @"Main Office", @"Other"];
        
        // Connect data
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
    }

-(void)appWillResignActive:(NSNotification*)note
{
    
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"View Will Dissapear");
    [[UIApplication sharedApplication] setIdleTimerDisabled:NO];

    
    if([_label.text isEqualToString:@"The student is signed out, press the button to sign in"]){
        NSString *savedUsername = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERNAME"];

        
        PFObject *PositionObject = [PFObject objectWithClassName:@"HallPass"];
        PositionObject[@"StudentName"] = savedUsername;
        PositionObject[@"InClassroom"] = @"Yes";
        [PositionObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // The object has been saved.
            } else {
                //There was a problem, check error.description
            }
        }];
        

        
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You have been checked back in"
                                                    message:@"By exiting HallPass without being signed in, you are automatically signed in"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}



- (IBAction)checkInOutPressed:(id)sender {
    
    NSString *savedUsername = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERNAME"];

    
    if(_inOrOut == 0){
    _label.text = @"The student is signed out, press the button to sign in";
    [_checkInOutButton setTitle: @"Check In" forState: UIControlStateNormal];
        //_label.backgroundColor = [UIColor greenColor];
        UIImage *buttonImage = [UIImage imageNamed:@"switch.png"];
        
        
        [_checkInOutButton setImage:buttonImage forState:UIControlStateNormal];
        
       //[_checkInOutButton setFrame:CGRectMake(173, 269, 130, 44)];
        
        _pickerView.hidden = YES;
        //_goingToLabel.hidden = YES;
        
    _inOrOut = 1;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Signed Out"
                                                        message:@"Please lock your device to complete checking out"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
        


        
        NSInteger row;
        //NSArray *repeatPickerData;
        UIPickerView *repeatPickerView;
        
        row = [_pickerView selectedRowInComponent:0];
        NSString *strPrintRepeat = [pickerData objectAtIndex:row];
        
        NSLog(@"SELECTED:::%@", strPrintRepeat);
        _placeLabel.text = strPrintRepeat;
        _goingToLabel.text = @"Away at";
        _placeLabel.hidden = NO;
        
        [[NSUserDefaults standardUserDefaults] setObject:@"CheckedOut" forKey:@"INOUT"];
        [[NSUserDefaults standardUserDefaults] setObject:strPrintRepeat forKey:@"PLACE"];
        
        PFObject *PositionObject = [PFObject objectWithClassName:@"HallPass"];
        PositionObject[@"StudentName"] = savedUsername;
        PositionObject[@"InClassroom"] = @"No";
        PositionObject[@"GoingTo"] = strPrintRepeat;
        [PositionObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }];
        
    }
    else{
        _label.text = @"The student is signed in, press the button to sign out";
        [_checkInOutButton setTitle: @"Check Out" forState: UIControlStateNormal];
        //_label.backgroundColor = [UIColor grayColor];

        
        _pickerView.hidden = NO;
        _goingToLabel.hidden = NO;
        _goingToLabel.text = @"Going to";
        _placeLabel.hidden = YES;
        
        UIImage *buttonImage = [UIImage imageNamed:@"switch2.png"];
        
        
        [_checkInOutButton setImage:buttonImage forState:UIControlStateNormal];
        
        _inOrOut = 0;
        
        PFObject *PositionObject = [PFObject objectWithClassName:@"HallPass"];
        PositionObject[@"StudentName"] = savedUsername;
        PositionObject[@"InClassroom"] = @"Yes";
        [PositionObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"CheckedIn" forKey:@"INOUT"];

        
    }
}

    

@end
