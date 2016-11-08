//
//  AddFoodViewController.m
//  FoodJournal1
//
//  Created by BridgeLabz on 25/10/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import "AddFoodViewController.h"

@interface AddFoodViewController ()

@end

@implementation AddFoodViewController
@synthesize foodtextField;
@synthesize restaurantTextField;
@synthesize foodJournalTableViewController;
@synthesize ratingControl;

@synthesize locationManager;
@synthesize activityIndicator;
@synthesize locationLable;

#pragma -View lifecycle

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (locationManager == nil)
    {
        locationManager = [[CLLocationManager alloc]init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        //locationManager.purpose = @"The location is used to save the restaurant location.";
//        [locationManager setDelegate:self];
//        [locationManager setDesiredAccuracy:kCLLocationAccuracyKilometer];
//        [locationManager setPurpose:@"The location is used to save the restaurant location."];
    }
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    locationLable.text = @"Updating Location...";
    [locationManager stopUpdatingLocation];
}

#pragma mark - Location Manager Delegate Methods

//-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
//- (void)locationManager:(CLLocationManager *)manager
  //   didUpdateLocations:(NSArray *)locations
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [locationManager stopUpdatingLocation]; //kill it NOW or we have duplicates
    NSLog(@"didUpdateToLocation: %@", newLocation);


    [activityIndicator stopAnimating];
    locationLable.text = @"Location Received";
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [activityIndicator stopAnimating];
    locationLable.text = @"Location Error";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addFoodButtonPressed:(id)sender
{
    [locationManager stopUpdatingLocation];
    NSString *newFoodName = [foodtextField text];
    NSString *newRestaurantNme = [restaurantTextField text];
    
    NSString *rating = @"OK";
    if ([ratingControl selectedSegmentIndex] == 0)
    {
        rating = @"Good";
    }
    else if ([ratingControl selectedSegmentIndex] == 1)
    {
        rating = @"Bad";
    }
    
//    NSNumber *longitudeNumber = [[NSNumber alloc] initWithFloat:0.0];
//    NSNumber *latitudeNumber = [[NSNumber alloc] initWithFloat:0.0];
    //or
    
    NSNumber *longitudeNumber = [NSNumber numberWithFloat:0.0];
    NSNumber *latitudeNumber = [NSNumber numberWithFloat:0.0];
    
    if (locationManager.location != nil) {
//        CLLocation *currentLocation = locationManager.location;
//        CLLocationCoordinate2D currentCoordinate = currentLocation.coordinate;
        //or
        CLLocationCoordinate2D currentCoordinate = locationManager.location.coordinate;
        
        longitudeNumber = [NSNumber numberWithFloat:currentCoordinate.longitude];
        latitudeNumber = [NSNumber numberWithFloat:currentCoordinate.latitude];
    }
    
    NSDictionary *newFood = [[NSDictionary alloc] initWithObjectsAndKeys:newFoodName, kFoodName, newRestaurantNme, kRestaurantNaame,rating, kRating, latitudeNumber, kLatitude, longitudeNumber, kLongitude, nil];
    [foodJournalTableViewController addFood:newFood];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
@end
