//
//  ViewController.m
//  CrashBoat
//
//  Created by Mrlee on 2018/3/6.
//  Copyright © 2018年 Mrlee. All rights reserved.
//

#import "ViewController.h"
#import "SiHomeMainCell.h"
#import "SiHomeModel.h"
#import "SiViewController.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/** 首页*/
@property (nonatomic ,strong) UICollectionView *homeCollectionView;
/** 数组*/
@property (nonatomic ,strong) NSMutableArray * ZeroTenArray;
@property (strong, nonatomic) NSURLRequest * request;
@end

@implementation ViewController
static NSString * cellIDtifier = @"maincell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self setUpUI];
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app名称
//    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    
   
    
    [self startTime];
}
-(void)startTime
{
    //获取当前时间
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH-mm-sss"];
    //获取设备时间
     NSDate *startDate = [NSDate date];
    
    NSDate *endDate = [dateFormatter dateFromString:[self getyyyymmdd]];
    NSDate *endDate_tomorrow = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([endDate timeIntervalSinceReferenceDate])];

    NSTimeInterval timeInterval =[startDate timeIntervalSinceDate:endDate_tomorrow];
    
    //秒数
    NSInteger second =(NSInteger)timeInterval;
    //此处判断即可如果second大于10*24*3600就去执行方法
    if (second>=10*24*3600) {
        //可以推送！可以执行方法
         NSLog(@"推送吧大兄弟");
        [self click];
     
    }
    else
    {
      //10天倒计时还没到呢！！！
        NSLog(@"还没到火候！不要急!");
    }
  
}

-(NSString *)getyyyymmdd{
    NSDateFormatter *formatDay = [[NSDateFormatter alloc] init];
    formatDay.dateFormat = @"yyyy-MM-dd HH-mm-sss";
    NSDate *resDate = [formatDay dateFromString:@"2018-3-12 00-00-00"];
    NSString *dayStr = [formatDay stringFromDate:resDate];
    
    return dayStr;
    
}
-(void)click
{//跳转

    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"wx5525912ec3511b13://"]];
}


-(void)setUpUI
{
    self.view.backgroundColor  = [UIColor groupTableViewBackgroundColor];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0 , 0, 0, 0);
    _homeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height) collectionViewLayout:layout];
    _homeCollectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _homeCollectionView.contentInset =UIEdgeInsetsMake(0, 0, 0, 0) ;
    _homeCollectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_homeCollectionView];
    
    _homeCollectionView.delegate = self;
    _homeCollectionView.dataSource = self;
    //注册cell
    [_homeCollectionView registerClass:[SiHomeMainCell class] forCellWithReuseIdentifier:cellIDtifier];
   
}


#pragma mark - Action  Method
//导航栏左右触发动作
-(void)leftItemAction{
    
    
    
}
#pragma mark - UITableView  DataSource

#pragma mark - UITableView  Delegate

#pragma mark - UICollectionView DataSource
#pragma mark - UICollectionViewDataSource
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section==0) {
        return self.ZeroTenArray.count;
    }
   
    return 0;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *gridcell = nil;
    
    if (indexPath.section == 0) {
        //按钮
        SiHomeMainCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIDtifier forIndexPath:indexPath];
        cell.model = self.ZeroTenArray[indexPath.row];
        gridcell = cell;
    }
   
    return gridcell;
}



//item 宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return CGSizeMake((self.view.frame.size.width-2)/3,(self.view.frame.size.width-2)/3);
    }
    
    return CGSizeMake((self.view.frame.size.width-2)/3,(self.view.frame.size.width-2)/3);
}
//边缘间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section==0) {
        return UIEdgeInsetsMake(0, 0.0f, 0, 0);
    }
    else
    {
        return UIEdgeInsetsMake(8, 0.0f, 0, 0);
    }
    return UIEdgeInsetsMake(0, 0.0f, 0, 0);
}

//x 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    
    return 0;
}

//y 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 1;
}
#pragma mark - 点击
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    相应的在此处判断，如果roleid=9则为全部，统计数据，线索录入 反之！则为全部， 我的下属，统计数据！！
    SiViewController * Vc = [[SiViewController alloc]init];
    [self.navigationController pushViewController:Vc animated:YES];
  
}
//跳转
-(void)RuntoHtml5:(NSString *)html Title:(NSString *)title
{
   
  
    
}

#pragma mark - UICollectionView Delegate

#pragma mark - NewWork Request Method

#pragma mark - Lazy Load
-(NSMutableArray *)ZeroTenArray
{
    NSArray * temarray1= [NSArray array];
    NSArray * Imagearray= [NSArray array];
    //在此处判断如果roleid==9我的下属隐藏！线索录入显示
  

        temarray1=@[@"全部",@"我的",@"数据",@"分享",@"车型",@"服务"];
        Imagearray=@[@"全部客户",@"我的下属",@"统计数据",@"营销分享",@"车型",@"售后"];
    
    
    
    if (!_ZeroTenArray) {
        _ZeroTenArray = [NSMutableArray array];
        for (NSInteger i=0; i<temarray1.count; i++) {
            SiHomeModel * model = [[SiHomeModel alloc]init];
            model.thumb = Imagearray[i];
            model.name  = temarray1[i];
            [_ZeroTenArray addObject:model];
        }
    }
    
    return _ZeroTenArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
