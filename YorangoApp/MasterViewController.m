//
//  MasterViewController.m
//  Mhacks
//
//  Created by Jessica Shu on 9/21/13.
//  Copyright (c) 2013 Jessica Shu. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "SettingsViewController.h"
#import "MenuViewController.h"

@interface MasterViewController ()
{
    NSMutableArray *_objects;
}

@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *menu = [UIButton buttonWithType:UIButtonTypeCustom];
    [menu setFrame:CGRectMake(5.0f, 0.0f, 27.0f, 27.0f)];
    [menu addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    [menu setImage:[UIImage imageNamed:@"navicon.png"] forState:UIControlStateNormal];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:menu];
    
    UIButton *settings = [UIButton buttonWithType:UIButtonTypeCustom];
    [settings setFrame:CGRectMake(180.0f, 0.0f, 35.0f, 35.0f)];
    [settings addTarget:self action:@selector(showSettings) forControlEvents:UIControlEventTouchUpInside];
    [settings setImage:[UIImage imageNamed:@"settings.png"] forState:UIControlStateNormal];
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithCustomView:settings];
    
    self.navigationItem.leftBarButtonItem = menuButton;
    self.navigationItem.rightBarButtonItem = settingsButton;
}

- (void)showSettings
{
    SettingsViewController *settingsVC = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    [self.navigationController pushViewController:settingsVC animated:YES];
}
- (void)showMenu
{
    MenuViewController *menuVC = [[MenuViewController alloc] initWithStyle:UITableViewStylePlain];
    //  this line is causing a crash!!
    [self.navigationController pushViewController:menuVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!_objects) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"houses" ofType:@"plist"];
        NSLog(@"%@",path);
        NSMutableArray *listings = [NSMutableArray arrayWithContentsOfFile:path];
        _objects = listings;
    }
    NSLog(@"%d",_objects.count);
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                   reuseIdentifier:@"Cell"];

    NSDictionary *object = _objects[indexPath.row];
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:cell.frame];
    [view setImage:[UIImage imageNamed:[object valueForKey:@"Filename"]]];
    cell.backgroundView = view;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [object valueForKey:@"Address"];
    cell.detailTextLabel.text = [object valueForKey:@"Price"];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showDetail" sender:nil];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
