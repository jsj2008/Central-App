//
//  UserDataViewController.h
//  Central
//
//  Created by Caleb Linburg on 8/18/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDataViewController : UIViewController<NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameBlank;
@property (weak, nonatomic) IBOutlet UITextField *passwordBlank;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *libraryButton;
@property (weak, nonatomic) IBOutlet UIButton *outsideButton;
@property (weak, nonatomic) IBOutlet UIProgressView *libraryActivity;

@property (weak, nonatomic) IBOutlet UIProgressView *outsideActivity;
@property (weak, nonatomic) IBOutlet UIProgressView *lobbyActivity;
@property (weak, nonatomic) IBOutlet UIButton *lobbyButton;
@property (weak, nonatomic) IBOutlet UILabel *loggedInButton;
@property (weak, nonatomic) IBOutlet UILabel *LoggedIniPhone;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;

@property (retain, nonatomic) NSURLConnection *connection;

@property (retain, nonatomic) NSMutableData *receivedData;


@end
