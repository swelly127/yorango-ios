//
//  DetailViewController.h
//  Mhacks
//
//  Created by Jessica Shu on 9/21/13.
//  Copyright (c) 2013 Jessica Shu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
