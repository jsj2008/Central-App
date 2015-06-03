//
//  APPMasterViewController.m
//  RSSreader
//
//  Created by Rafael Garcia Leiva on 08/04/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//
//
//

#import "APPMasterViewController.h"

#import "APPDetailViewController.h"

#import "Parse/Parse.h"

@interface APPMasterViewController () {
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
}
@end

@implementation APPMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

}

-(void)viewDidAppear:(BOOL)animated{
    
   
    
    NSLog(@"Started");
    
    NSString *currentRSSURL = [[NSUserDefaults standardUserDefaults] objectForKey:@"RSSURL"];
    
    NSLog(@"Step 1");
    
    feeds = [[NSMutableArray alloc] init];

    NSLog(@"Step 2");
    NSURL *url = [NSURL URLWithString:currentRSSURL];
    NSLog(@"Step 3");
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    NSLog(@"Step 4");
    [parser setDelegate:self];
    NSLog(@"Step 5");
    [parser setShouldResolveExternalEntities:NO];
    NSLog(@"Step 6");
    [parser parse];
    NSLog(@"DONE");
    
}
-(void)viewWillAppear:(BOOL)animated{
  
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey: @"title"];
    return cell;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"item"]) {
        
        item    = [[NSMutableDictionary alloc] init];
        title   = [[NSMutableString alloc] init];
        link    = [[NSMutableString alloc] init];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        
        [feeds addObject:[item copy]];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    }
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    [self.tableView reloadData];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Seque");
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSLog(@"Seque");
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *string = [feeds[indexPath.row] objectForKey: @"link"];
        [[segue destinationViewController] setUrl:string];
        
    }
}

@end
