//
//  ViewController.m
//  TipCalculator
//
//  Created by Divakar Y N on 21/10/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_lable setText:@"HI"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
//1    NSString * userInput;
//    userInput = [_textField text];
//    [_lable setText:userInput];
    //OR
    //1[_lable setText:[_textField text]];
    
// 2   NSString *newString = @"my new String";
// 2   [_lable setText:newString];
//    
// 3   NSString * userInput = [_textField text];
//    NSString * newString = [@"Hello " stringByAppendingString:userInput];
// 3   [_lable setText:newString];
    
    NSString *userInput = [_textField text];
    
    if ([userInput length] == 0)
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Bill Amount"  message:@"You Forgot to type a bill Amount"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else{
    float billAmount = [userInput floatValue];
    float tipAmount = [_slider value]*billAmount;
    NSString *tipString = [[NSString alloc] initWithFormat:@"%1.2f",tipAmount/10];
    
    [_lable setText:tipString];
    }
   
}

- (IBAction)sliderChanged:(id)sender {
    
    NSString *currentTipString = [[NSString alloc] initWithFormat:@"%1.2f%%",[_slider value]*10];
    [_currentTipLable setText:currentTipString];
}
@end
