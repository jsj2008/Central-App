//
//  SuggestionsViewController.h
//  Central
//
//  Created by Caleb Linburg on 9/6/14.
//  Copyright (c) 2014 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuggestionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UILabel *saved;

@end
