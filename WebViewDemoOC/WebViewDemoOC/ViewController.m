//
//  ViewController.m
//  WebViewDemoOC
//
//  Created by Divakar Y N on 25/10/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // setting the url
    NSString *urlString = @"https://www.google.co.in/";
    // or
    //NSString *urlString = @"https://www.facebook.com/";
    NSURL *url = [NSURL URLWithString:urlString];
    //creating the request
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    //loading the request
    [_webView loadRequest:urlRequest];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
