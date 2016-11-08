//
//  FoodDetailVC.m
//  FoodJournal1
//
//  Created by BridgeLabz on 26/10/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import "FoodDetailVC.h"
#import "FoodJournalTableViewController.h"

@implementation FoodDetailVC

@synthesize foodLable;
@synthesize restaurantLable;
@synthesize food;
@synthesize ratingLable;
@synthesize mapView;

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [foodLable setText:[food objectForKey:kFoodName]];
    [restaurantLable setText:[food objectForKey:kRestaurantNaame]];
    
    NSString *foodRating = [food objectForKey:kRating];
    NSString *foodRatingSentence = [[NSString alloc] initWithFormat:@"The Food is %@",foodRating];
    [ratingLable setText:foodRatingSentence];
    
    NSNumber *latitude = [food objectForKey:kLatitude];
    NSNumber *longitude = [food objectForKey:kLongitude];
    
    MKCoordinateRegion region;
    region.span = MKCoordinateSpanMake(0.02, 0.02);
    region.center = CLLocationCoordinate2DMake([latitude floatValue], [longitude floatValue]);
    [mapView setRegion:region];
    
}



@end
