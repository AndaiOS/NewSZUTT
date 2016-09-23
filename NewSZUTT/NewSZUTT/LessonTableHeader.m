//
//  LessonTableHeader.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/6.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "LessonTableHeader.h"

@implementation LessonTableHeader

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        float h = 44;
        float btn_width = Screen_Width / 6;//按钮宽度
        float btn_height = h;//按钮高度
        float space = (Screen_Width - (6 * btn_width)) / 7;//第一个按钮的起始位置
        float padding = space + btn_width;
        
        _weekBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_weekBtn setBackgroundColor:[UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:0.6]];
        [self addSubview:_weekBtn];
        _weekBtn.frame = CGRectMake(space, (h-btn_height)/2, btn_width, btn_height);
        [_weekBtn setTitle:@"00" forState:UIControlStateNormal];
        _weekBtn.userInteractionEnabled = NO;
        [_weekBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        _monBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_monBtn setBackgroundColor:[UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:0.65]];
        [self addSubview:_monBtn];
        _monBtn.frame = CGRectMake(space + padding, (h-btn_height)/2, btn_width, btn_height);
        [_monBtn setTitle:@"Mon" forState:UIControlStateNormal];
        [_monBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _monBtn.tag = 10002;
        _monBtn.userInteractionEnabled = YES;
        
        _tueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tueBtn setBackgroundColor:[UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:0.70]];
        [self addSubview:_tueBtn];
        _tueBtn.frame = CGRectMake(space + padding * 2, (h-btn_height)/2, btn_width, btn_height);
        [_tueBtn setTitle:@"Tue" forState:UIControlStateNormal];
        [_tueBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _tueBtn.tag = 10003;
        _tueBtn.userInteractionEnabled = YES;
        
        _wedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_wedBtn setBackgroundColor:[UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:0.75]];
        [self addSubview:_wedBtn];
        _wedBtn.frame = CGRectMake(space + padding * 3, (h-btn_height)/2, btn_width, btn_height);
        [_wedBtn setTitle:@"Wed" forState:UIControlStateNormal];
        [_wedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _wedBtn.tag = 10004;
        _wedBtn.userInteractionEnabled = YES;
        
        _thrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_thrBtn setBackgroundColor:[UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:0.8]];
        [self addSubview:_thrBtn];
        _thrBtn.frame = CGRectMake(space + padding * 4, (h-btn_height)/2, btn_width, btn_height);
        [_thrBtn setTitle:@"Thr" forState:UIControlStateNormal];
        [_thrBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _thrBtn.tag = 10005;
        _thrBtn.userInteractionEnabled = YES;
        
        _friBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_friBtn setBackgroundColor:[UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:0.85]];
        [self addSubview:_friBtn];
        _friBtn.frame = CGRectMake(space + padding * 5, (h-btn_height)/2, btn_width, btn_height);
        [_friBtn setTitle:@"Fri" forState:UIControlStateNormal];
        [_friBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _friBtn.tag = 10006;
        _friBtn.userInteractionEnabled = YES;
        
    }
    return self;
}
-(void)setWeekNumber:(NSInteger)weeknumber{
    //NSInteger对应ld
    NSString * str = [NSString stringWithFormat:@"%ld",(long)weeknumber];
    _weekBtn.titleLabel.text = str;
}



@end
