//
//  HallPassViewController.h
//  Central
//
//  Created by Caleb Linburg on 3/11/15.
//  Copyright (c) 2015 Caleb Linburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HallPassViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *checkInOutButton;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *goingToLabel;

@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

@end
