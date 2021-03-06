//
//  FavoritesTableViewController.m
//  quotable
//
//  Created by Erika Johnson on 4/8/15.
//  Copyright (c) 2015 Erika Marie Johnson. All rights reserved.
//

#import "FavoritesTableViewController.h"

@interface FavoritesTableViewController ()

@end

@implementation FavoritesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.quotes = [QuotesModel sharedModel];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated {
    if (self) [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.quotes numberOfFavorites];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    
    static NSString *CellIdentifier = @"QuoteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary *quote = [self.quotes favoriteAtIndex:indexPath.row];
    NSString *quoteText = [quote valueForKey:@"quote"];
    NSString *authorText = [quote valueForKey:@"author"];
    //    NSString *cellText = [[[quoteText stringByAppendingString:@" ("] stringByAppendingString:authorText] stringByAppendingString:@")"];
    [cell.textLabel setNumberOfLines:5]; // unlimited number of lines
    [cell.textLabel setLineBreakMode:UILineBreakModeWordWrap];
    cell.textLabel.text = quoteText;
    cell.detailTextLabel.text = authorText;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Unfavorite";
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete from the model
        [self.quotes removeFavoriteAtIndex:indexPath.row];
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation


@end
