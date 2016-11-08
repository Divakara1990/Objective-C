//
//  ViewController.h
//  TipCalculator
//
//  Created by Divakar Y N on 21/10/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *currentTipLable;



- (IBAction)buttonPressed:(id)sender;
- (IBAction)sliderChanged:(id)sender;

@end

