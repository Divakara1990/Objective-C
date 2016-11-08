//
//  AddFoodViewController.h
//  FoodJournal1
//
//  Created by BridgeLabz on 25/10/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodJournalTableViewController.h"
#import "CoreLocation/CoreLocation.h"


@interface AddFoodViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, weak) FoodJournalTableViewController *foodJournalTableViewController;
@property (weak, nonatomic) IBOutlet UITextField *foodtextField;
@property (weak, nonatomic) IBOutlet UITextField *restaurantTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ratingControl;
@property (weak, nonatomic) IBOutlet UILabel *locationLable;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, strong) CLLocationManager *locationManager;

- (IBAction)addFoodButtonPressed:(id)sender;
@end
