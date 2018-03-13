//
//  SiHomeMainCell.m
//  SijiaClub
//
//  Created by YeGuo on 2017/11/24.
//  Copyright © 2017年 YeGuo. All rights reserved.
//

#import "SiHomeMainCell.h"
#import "SiHomeModel.h"
#import <Masonry.h>
@interface SiHomeMainCell()

@property (strong, nonatomic) UIImageView * HeadImageView;
@property (strong, nonatomic) UILabel * TitleLabel;

@end

@implementation SiHomeMainCell

#pragma mark - Intial
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    _HeadImageView = [[UIImageView alloc]init];
    _HeadImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_HeadImageView];
    
    _TitleLabel = [[UILabel alloc]init];
    _TitleLabel.font = [UIFont systemFontOfSize:14];
    _TitleLabel.numberOfLines = 2;
    _TitleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_TitleLabel];
    
    
    
    
}
#pragma mark - 布局子视图
-(void)layoutSubviews
{
    [super layoutSubviews];
    [_HeadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.equalTo(self.mas_centerY).offset(-20);
        make.size.mas_equalTo(CGSizeMake(40,40));
    }];
    [_TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.equalTo(_HeadImageView.mas_bottom).with.offset(10);
    }];
    
    
    
}
-(void) setModel:(SiHomeModel *)model
{
    //    [_HeadImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:nil];
    [_HeadImageView setImage:[UIImage imageNamed:model.thumb]];
    [_TitleLabel setText:model.name];
}

@end
