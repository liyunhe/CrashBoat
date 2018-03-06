//
//  ViewController.m
//  CrashBoat
//
//  Created by Mrlee on 2018/3/6.
//  Copyright © 2018年 Mrlee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.scalesPageToFit = YES;
    self.webView.scrollView.bouncesZoom = NO;
    self.webView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://previews.envatousercontent.com/files/236036861/index.html"]];
    [self.webView loadRequest:request];//加载网页
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
