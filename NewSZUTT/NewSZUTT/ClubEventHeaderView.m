//
//  ClubEventHeaderView.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/7.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "ClubEventHeaderView.h"
#import "ClubHomePageViewController.h"

@interface ClubEventHeaderView(){
    UIView * _view;
    UIButton * _hotClubBtn[8];
    UIImageView * _hotClubImg[8];
    UIView * _rowlineView[4];
    UIView * _lielineView[6];
}

@end

@implementation ClubEventHeaderView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = MainWhiteColor;
        //大白框
        _view = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.01, 0, Screen_Width * 0.98, 150)];
        _view.backgroundColor = [UIColor whiteColor];
        _view.layer.cornerRadius = 2;
        _view.layer.backgroundColor = [UIColor whiteColor].CGColor;
        _view.layer.shadowOffset = CGSizeMake(0.5,1);
        _view.layer.shadowRadius = 0.1;
        _view.layer.shadowOpacity = 0.1;
        [self addSubview:_view];
        
        
        int btnwidth = 70;
        int btnheight = 70;
        int imgwidth = 40;
        int imgheight = 40;
        float rowspace = (Screen_Width * 0.98 - 4 * btnwidth)/5;
        float liespace = (150 - btnheight * 2) / 2;
        
        //行线
        int rowlinewidth = 60;
        int rowlineheight = 1;
        
        //列线
        int lielinewidth = 1;
        int lielinehegiht = 60;
        
        int i = 0;
        for(i=0;i<8;i++){
            _hotClubBtn[i] = [[UIButton alloc]initWithFrame:CGRectMake(
                                                                       _view.frame.origin.x + rowspace * (i%4+1) + btnwidth * (i%4),liespace * (i/4 + 1) + btnheight * (i/4), btnwidth, btnheight)];
            _hotClubImg[i] = [[UIImageView alloc]initWithFrame:CGRectMake((btnwidth - imgwidth)/2, (btnheight - imgheight)/2, 40, 40)];
            if(i%4 == 0)
                _hotClubImg[i].image = [UIImage imageNamed:@"eat"];
            if(i%4 == 1)
                _hotClubImg[i].image = [UIImage imageNamed:@"drink"];
            if(i%4 == 2)
                _hotClubImg[i].image = [UIImage imageNamed:@"play"];
            if(i%4 == 3)
                _hotClubImg[i].image = [UIImage imageNamed:@"fun"];
            _hotClubImg[i].layer.cornerRadius = 8;
            
            if(i < 4){
                _rowlineView[i] = [[UIView alloc]initWithFrame:CGRectMake(_hotClubBtn[i].frame.origin.x + (btnwidth - rowlinewidth)/2, _hotClubBtn[i].frame.origin.y + btnheight + (liespace - rowlineheight)/2, rowlinewidth, rowlineheight)];
                [_rowlineView[i] setBackgroundColor:[UIColor colorWithRed:225.0/255 green:225.0/255 blue:225.0/255 alpha:0.5]];
                [_view addSubview:_rowlineView[i]];
            }
            
            [_hotClubBtn[i] setBackgroundColor:[UIColor whiteColor]];
            [_hotClubBtn[i] addSubview:_hotClubImg[i]];
            [_hotClubBtn[i] addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            _hotClubBtn[i].tag = i;
            
            [_view addSubview:_hotClubBtn[i]];
        }
    }
    return self;
}
- (void)buttonClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (_delegate && [_delegate respondsToSelector:@selector(ClubHeaderViewButtonClick:)]) {
        [_delegate ClubHeaderViewButtonClick:button];
    }
}
@end
