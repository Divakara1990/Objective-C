//
//  ViewController.m
//  LocalFileView
//
//  Created by Divakar Y N on 08/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize webView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"/Users/bridgelabz/Desktop/divakar/Objective-C/LocalFileView";
        NSString *localURL = [NSBundle pathForResource:@"index" ofType:@"html" inDirectory:str];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:localURL]];
        [webView loadRequest:urlRequest];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
