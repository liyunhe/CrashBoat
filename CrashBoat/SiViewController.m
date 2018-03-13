//
//  SiViewController.m
//  CrashBoat
//
//  Created by YeGuo on 2018/3/12.
//  Copyright © 2018年 Mrlee. All rights reserved.
//

#import "SiViewController.h"

@interface SiViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webVoew;

@end

@implementation SiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webVoew.scalesPageToFit = YES;
    self.webVoew.scrollView.bouncesZoom = NO;
    self.webVoew.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://previews.envatousercontent.com/files/236036861/index.html"]];
    [self.webVoew loadRequest:request];//加载网页
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

@end
