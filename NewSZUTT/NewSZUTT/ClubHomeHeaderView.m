//
//  ClubHomeHeaderView.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/7.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "ClubHomeHeaderView.h"

@interface ClubHomeHeaderView(){
    UIView * _view;
    UIImageView * _bigImg;
    UIImageView * _logo;
}

@end

@implementation ClubHomeHeaderView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = MainWhiteColor;
        
        //大白框
        _view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 150)];
        _view.backgroundColor = [UIColor whiteColor];
        _view.layer.cornerRadius = 2;
        _view.layer.backgroundColor = [UIColor whiteColor].CGColor;
        _view.layer.shadowOffset = CGSizeMake(0.5,1);
        _view.layer.shadowRadius = 0.1;
        _view.layer.shadowOpacity = 0.1;
        [self addSubview:_view];
        
        _bigImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 150)];
        [_bigImg setImage:[UIImage imageNamed:@"girlgod"]];
        [self addSubview:_bigImg];
        
        _logo = [[UIImageView alloc]initWithFrame:CGRectMake(0, _bigImg.frame.size.height + _bigImg.frame.origin.y - 80, 80, 80)];
        [_logo setImage:[UIImage imageNamed:@"cai"]];
        [self addSubview:_logo];
        
    }
    return self;
}


@end
