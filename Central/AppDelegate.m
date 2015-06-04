//
//  AppDelegate.m
//  Central
//
//  Created by Caleb Linburg on 8/15/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <ParseCrashReporting/ParseCrashReporting.h>


@implementation AppDelegate







- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //[self setShouldRotate:YES];
    
    //fixes window color
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    
    // Override point for customization after application launch.
    [ParseCrashReporting enable];
    [Parse setApplicationId:@"tmaAsvxOFn6NWpYMQ5JvEXfd5kO9qKnwiVpVHW8S"
                  clientKey:@"0I7Z95FnEcHI2QWq7FED1V2qduSgMShtJcvZX4wQ"];
    
    //Trakcing how many people open the App Daily thorugh Parse Analytics
   
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    

    //-- Set Notification
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
        // iOS 8 Notifications
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        
        [application registerForRemoteNotifications];
    }
    else
    {
        // iOS < 8 Notifications
      //  [application registerForRemoteNotificationTypes:
      //   (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
    }
    
    
    return YES;
}



- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken
{
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:newDeviceToken];
    [currentInstallation saveInBackground];
}


- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    NSString *inOut = [[NSUserDefaults standardUserDefaults] objectForKey:@"INOUT"];

    if([inOut isEqualToString:@"CheckedOut"]){
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    // current time plus 10 secs
    NSDate *now = [NSDate date];
    NSDate *dateToFire = [now dateByAddingTimeInterval:1];
    
    NSLog(@"now time: %@", now);
    NSLog(@"fire time: %@", dateToFire);
    
        
        NSString *place = [[NSUserDefaults standardUserDefaults] objectForKey:@"PLACE"];
        NSString *alertText = [NSString stringWithFormat:@"Student has checked out - %@", place];
        
    localNotification.fireDate = dateToFire;
    localNotification.alertBody = alertText;
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 0; // increment
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
