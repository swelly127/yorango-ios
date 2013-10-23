//
//  SettingsViewController.m
//
//  Created by Jessica Shu on 9/21/13.
//  Copyright (c) 2013 Jessica Shu. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad {
    [super viewDidLoad];
    pickerItems = [[NSArray alloc] initWithObjects:
                   @"Studio Bedroom",
                   @"1 Bedroom",
                   @"2 Bedrooms",
                   @"3 Bedrooms",
                   @"4 Bedrooms",
                   @"5+ Bedrooms", nil];
    
    for (NSString *item in pickerItems) {
        [myPicker selectRow:[pickerItems indexOfObject:item] inComponent:0 animated:YES];
    }
    myPicker.hidden = NO;
    [myPicker selectRow:(NSInteger)3 inComponent:0 animated:YES];
}

#pragma mark ---- UIPickerViewDataSource delegate methods ----

// returns the number of columns to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the number of rows
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [pickerItems count];
}

#pragma mark ---- UIPickerViewDelegate delegate methods ----

// returns the title of each row
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    currentItem = [pickerItems objectAtIndex:row];
    return currentItem;
}

// gets called when the user settles on a row
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    currentItem = [pickerItems objectAtIndex:row];
}

- (IBAction)setStateButtonPressed:(id)sender {
    myPicker.hidden = [myPicker isHidden] ? NO : YES;
}

@end
