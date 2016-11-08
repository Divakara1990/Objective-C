//
//  FoodJournalTableViewController.h
//  FoodJournal1
//
//  Created by BridgeLabz on 25/10/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFoodName @"FoodName"
#define kRestaurantNaame @"RestaurantName"
#define kRating @"Rating"
#define kLongitude @"Longitude"
#define kLatitude @"Latitude"

@interface FoodJournalTableViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *foodArray;

-(void) addFood:(NSDictionary *)newFood;
//-(void) saveData;
-(void) saveData:(NSNotification *)notification;
@end
