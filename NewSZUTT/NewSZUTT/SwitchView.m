//
//  SwitchView.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/4.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "SwitchView.h"

@implementation SwitchView
int currentTag;
UIColor *black;
UIColor *light;
UIFont *normalFont;
UIFont *lightFont;
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:16 alpha:1];
        float h = 35;
        float btn_width = 70;//按钮宽度
        float btn_height = h;//按钮高度
        float img_width = 20;
        float img_height = 20;
        
        float middlespace = 5;
        
        float space = (Screen_Width - (2 * btn_width + middlespace)) / 2;//第一个按钮的起始位置
        
        black = [UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1];//未被选中时的字体颜色
        light = MainBlueColor;//选中时的字体颜色
        
        normalFont = [UIFont boldSystemFontOfSize:15];
        lightFont = [UIFont boldSystemFontOfSize:17];
        
        
        
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button1.frame = CGRectMake(space, (h-btn_height)/2, btn_width, btn_height);
        //[_button1 setBackgroundImage:[UIImage imageNamed:@"day3"] forState:UIControlStateNormal];
        [_button1 setTitle:@"友人帐" forState:UIControlStateNormal];
        _button1.titleLabel.font = normalFont;
        [_button1 setTitleColor:black forState:UIControlStateNormal];
        _button1.tag = 10001;
        [_button1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        _button1.userInteractionEnabled = NO;
        [self addSubview:_button1];
        
        _img1 = [[UIImageView alloc]initWithFrame:CGRectMake(_button1.frame.origin.x - 30, (35 - 20)/2, img_width, img_height)];
        _img1.image = [UIImage imageNamed:@"friendaccount_focus"];
        _img1.layer.cornerRadius = 2;
        [self addSubview:_img1];
        
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button2];
        _button2.frame = CGRectMake(_button1.frame.origin.x + _button1.frame.size.width + middlespace, (h-btn_height)/2, btn_width, btn_height);
        [_button2 setTitle:@"推推客" forState:UIControlStateNormal];
        _button2.titleLabel.font = normalFont;
        [_button2 setTitleColor:black forState:UIControlStateNormal];
        _button2.tag = 10002;
        [_button2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        _button2.userInteractionEnabled = NO;
        
        _img2 = [[UIImageView alloc]initWithFrame:CGRectMake(_button2.frame.origin.x + _button2.frame.size.width + 5, (35 - 20)/2, img_width, img_height)];
        _img2.image = [UIImage imageNamed:@"pushguest_blur"];
        _img2.layer.cornerRadius = 2;
        [self addSubview:_img2];
        
        currentTag = 10001;//默认是老师电话
        
        [_button1 setTitleColor:light forState:UIControlStateNormal];//初始化为选中状态
        _button1.titleLabel.font = lightFont;
    }
    return self;
}
-(void)btnAction:(UIButton *)button{
    [self swipeAction:(int)button.tag];
}
-(void)swipeAction:(int)tag{
    UIColor * thisblack = black;
    switch (tag) {
        case 10001:
            currentTag = 10001;
            [_button1 setTitleColor:light forState:UIControlStateNormal];
            [_button2 setTitleColor:thisblack forState:UIControlStateNormal];
            _button1.titleLabel.font = lightFont;
            _button2.titleLabel.font = normalFont;
            _img1.image = [UIImage imageNamed:@"friendaccount_focus"];
            _img2.image = [UIImage imageNamed:@"pushguest_blur"];
            break;
        case 10002:
            currentTag = 10002;
            [_button1 setTitleColor:thisblack forState:UIControlStateNormal];
            [_button2 setTitleColor:light forState:UIControlStateNormal];
            _button1.titleLabel.font = normalFont;
            _button2.titleLabel.font = lightFont;
            _img1.image = [UIImage imageNamed:@"friendaccount_blur"];
            _img2.image = [UIImage imageNamed:@"pushguest_focus"];
            break;
        default:
            break;
    }
    
    if(_ButtonActionBlock){
        _ButtonActionBlock(tag);
    }
}
@end













