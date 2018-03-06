//
//  ViewController.m
//  CrashBoat
//
//  Created by Mrlee on 2018/3/6.
//  Copyright © 2018年 Mrlee. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
     dispatch_source_t _timer;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app名称
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    
    self.webView.scalesPageToFit = YES;
    self.webView.scrollView.bouncesZoom = NO;
    self.webView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://previews.envatousercontent.com/files/236036861/index.html"]];
    [self.webView loadRequest:request];//加载网页
    
    [self startTime];
}
-(void)startTime
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *endDate = [dateFormatter dateFromString:[self getyyyymmdd]];
    NSDate *endDate_tomorrow = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([endDate timeIntervalSinceReferenceDate] + 24*3600*11)];
    NSDate *startDate = [NSDate date];
    NSTimeInterval timeInterval =[endDate_tomorrow timeIntervalSinceDate:startDate];
    
    if (_timer==nil) {
        __block int timeout = timeInterval; //倒计时时间
        
        if (timeout!=0) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
            dispatch_source_set_event_handler(_timer, ^{
                if(timeout<=0){ //倒计时结束，关闭
                    dispatch_source_cancel(_timer);
                    _timer = nil;
                    dispatch_async(dispatch_get_main_queue(), ^{
            
                    });
                }else{
                    int days = (int)(timeout/(3600*24));
                 
                    int hours = (int)((timeout-days*24*3600)/3600);
                    int minute = (int)(timeout-days*24*3600-hours*3600)/60;
                    int second = timeout-days*24*3600-hours*3600-minute*60;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        NSLog(@"%d天：%d时：%d分：%d秒",days,hours,minute,second);
                    });
                    timeout--;
                }
            });
            dispatch_resume(_timer);
        }
    }
}

-(NSString *)getyyyymmdd{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatDay = [[NSDateFormatter alloc] init];
    formatDay.dateFormat = @"yyyy-MM-dd";
    NSString *dayStr = [formatDay stringFromDate:now];
    
    return dayStr;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
