//
//  FoodJournalTableViewController.m
//  FoodJournal1
//
//  Created by BridgeLabz on 25/10/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import "FoodJournalTableViewController.h"
#import "AddFoodViewController.h"
#import "FoodDetailVC.h"
@interface FoodJournalTableViewController ()

@end

@implementation FoodJournalTableViewController

@synthesize foodArray;


- (void) addFood:(NSDictionary *)newFood
{
    [foodArray addObject:newFood];
    //[self saveData];
    [[self tableView] reloadData];
    NSLog(@"adding food!");
}

- (NSString *)pListPath
{
    NSString *homeDirectory = NSHomeDirectory();
    NSString *filePath = [homeDirectory stringByAppendingString:@"/Documents/foods.plist"];
    return filePath;
}

-(void) saveData:(NSNotification *)notification
{
    //NSString *homeDirectory = NSHomeDirectory();
    //NSString *filePath = [homeDirectory stringByAppendingString:@"/Documents/foods.plist"];
    NSString *filePath;
    filePath = [self pListPath];
    [foodArray writeToFile:filePath atomically:YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"AddFoodSegue"])
    {
        AddFoodViewController *addFoodViewController = [segue destinationViewController];
        [addFoodViewController setFoodJournalTableViewController:self];
    }
    else if ([[segue identifier] isEqualToString:@"FoodDetailSegue"])
    {
        NSIndexPath *selectedRow = [[self tableView] indexPathForSelectedRow];
        NSDictionary *selectedFood = [foodArray objectAtIndex:[selectedRow row]];
        FoodDetailVC *foodDetailVC = [segue destinationViewController];
        [foodDetailVC setFood:selectedFood];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveData:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self pListPath]])
    {
        foodArray = [[NSMutableArray alloc] initWithContentsOfFile:[self pListPath]];
    }
    else
    {
        NSDictionary *firstFoodDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"Pizza",kFoodName,@"Pizza Place",kRestaurantNaame, @"Good",kRating, nil];
        foodArray = [[NSMutableArray alloc] initWithObjects:firstFoodDictionary, nil];
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [foodArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BasicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    int rowNumber = [indexPath row];
    NSDictionary *foodDictionary = [foodArray objectAtIndex:rowNumber];
    NSString *food = [foodDictionary objectForKey:kFoodName];
    NSString *restaurant = [foodDictionary objectForKey:kRestaurantNaame];
    [[cell textLabel] setText:food];
    [[cell detailTextLabel] setText:restaurant];
    NSLog(@"Table view is asking fr cell %ld",(long)[indexPath row]);
    return cell;
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
        // Delete the row from the data source
        [foodArray removeObjectAtIndex:[indexPath row]];
        NSLog(@"Deleting the Food");
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
