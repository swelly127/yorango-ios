//
//  SettingsViewController.h
//
//  Created by Jessica Shu on 9/21/13.
//  Copyright (c) 2013 Jessica Shu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UIPickerView *myPicker;
    NSArray *pickerItems;
    NSString *currentItem;
}

@end