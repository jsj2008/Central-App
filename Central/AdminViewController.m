//
//  AdminViewController.m
//  Central
//
//  Created by Caleb Linburg on 9/8/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import "AdminViewController.h"
#import "Parse/Parse.h"

@interface AdminViewController ()

@end

@implementation AdminViewController

- (IBAction)sendPressed:(id)sender {
    
    NSString *text = _textView.text;
    NSString *passText = _passTextView.text;
    
    // Create our Installation query
    PFQuery *pushQuery = [PFInstallation query];
    [pushQuery whereKey:@"deviceType" equalTo:@"ios"];
    
    if([passText isEqualToString:@"3HDMWtmkcX4DghJWkkwazAwU"]){
    // Send push notification to query
    [PFPush sendPushMessageToQueryInBackground:pushQuery
                                   withMessage: text];
    }
    
    _textView.text = @"";
    _passTextView.text = @"";
    
    //Test______________________________________________________________________________
    

        NSString *path = [[NSBundle mainBundle] pathForResource:@"CYSD" ofType:@"ics"];
         NSURL *url = [NSURL fileURLWithPath:path];
       // UIDocumentInteractionController *dc = [UIDocumentInteractionController interactionControllerWithURL:url];
        //dc.delegate = self;
        //[dc presentPreviewAnimated:YES];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com"]];
        exit(0);
         });

//Test__________________________________________________________________________
//-(UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller
//{
//    return self;
//}

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Verify Touch ID for Password";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL succes, NSError *error) {
                                if (succes) {
                                    _passTextView.text = @"Passcode";
                                } else {
                                    // User did not authenticate successfully, look at error and take appropriate action
                                }
                            }];
    } else {
        // Could not evaluate policy; look at authError and present an appropriate message to user
    }
    
    
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
