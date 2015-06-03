//
//  APPMasterViewController.h
//  RSSreader
//
//  Created by Rafael Garcia Leiva on 08/04/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPMasterViewController : UITableViewController <NSXMLParserDelegate>{
    NSString *rssFeedURL;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end