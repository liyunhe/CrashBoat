//
//  MainTabBarController.h
//  lottery
//
//  Created by wayne on 17/1/17.
//  Copyright © 2017年 施冬伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPHomePageVC.h"
#import "CPBuyLotteryVC.h"
#import "CPLotteryResultVC.h"
#import "CPLotteryTrendVC.h"
#import "CPMineVC.h"
#import "CPLoginViewController.h"

@interface MainTabBarController : UITabBarController

-(void)goToLoginViewController;
-(void)goToTrendViewControllerWithGid:(NSString *)gid;
-(void)goToMineViewController;
-(void)goToHomepageViewController;
-(void)goToLotteryResultViewController;
-(void)goToDetailResultViewControllerWithGid:(NSString *)gid;

@end
