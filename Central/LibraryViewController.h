//
//  LibraryViewController.h
//  Central
//
//  Created by Alex Santarelli on 1/19/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface LibraryViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction)mailTechHelp:(id)sender;

@end
