//
//  FoodDetailVC.h
//  FoodJournal1
//
//  Created by BridgeLabz on 26/10/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface FoodDetailVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *foodLable;
@property (weak, nonatomic) IBOutlet UILabel *restaurantLable;
@property (weak, nonatomic) IBOutlet UILabel *ratingLable;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@property (nonatomic, strong) NSDictionary *food;
@end
