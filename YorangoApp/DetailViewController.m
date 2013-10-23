//
//  DetailViewController.m
//  Mhacks
//
//  Created by Jessica Shu on 9/21/13.
//  Copyright (c) 2013 Jessica Shu. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.title = self.detailItem[@"Address"];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
        imageView.image = [UIImage imageNamed:self.detailItem[@"Filename"]];

        UIImage *original = [UIImage imageNamed:self.detailItem[@"Filename"]];
        UIImage *one = [UIImage imageNamed:@"rotation1.jpg"];
        UIImage *two = [UIImage imageNamed:@"rotation2.jpg"];
        NSArray *houseImages = [NSArray arrayWithObjects: original, one, two, nil];
        
        imageView.animationImages = houseImages;
        imageView.animationDuration = 5.0;
        imageView.animationRepeatCount = 5;
        
        [imageView startAnimating];
        [self.view addSubview:imageView];
        
        UITextView *descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 + 10.0, self.view.frame.size.width, self.view.frame.size.height/2)];
        NSString *description =  [NSString stringWithFormat:@"Price: %@ \nOwner: %@ \nBedrooms: %@ \nDates Available: %@ \nLease Type: %@", self.detailItem[@"Price"], self.detailItem[@"Name of Owner"], self.detailItem[@"Bedrooms"], self.detailItem[@"Date"], self.detailItem[@"Type"]];
        descriptionView.text = description;
        descriptionView.editable = NO;
        [self.view addSubview:descriptionView];
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
