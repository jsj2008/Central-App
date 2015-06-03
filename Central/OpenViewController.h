//
//  OpenViewController.h
//  Central
//
//  Created by Caleb Linburg on 1/17/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpenViewController : UIViewController<NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIButton *skipButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameBlank;
@property (weak, nonatomic) IBOutlet UITextField *passwordBlank;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *libraryButton;
@property (weak, nonatomic) IBOutlet UIButton *outsideButton;
@property (weak, nonatomic) IBOutlet UIButton *lobbyButton;
@property (weak, nonatomic) IBOutlet UIProgressView *LibraryActivity;
@property (weak, nonatomic) IBOutlet UIProgressView *lobbyActivity;
@property (weak, nonatomic) IBOutlet UIProgressView *outsideActivity;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneSkipButton;

@property (retain, nonatomic) NSURLConnection *connection;

@property (retain, nonatomic) NSMutableData *receivedData;

@end
