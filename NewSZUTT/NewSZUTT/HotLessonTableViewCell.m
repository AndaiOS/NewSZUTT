//
//  HotLessonTableViewCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/25.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "HotLessonTableViewCell.h"

@interface HotLessonTableViewCell(){
    UIView * _containerView;
    UIButton * _hotlessonBtn[4];
}

@end

@implementation HotLessonTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = MainWhiteColor;
        
        _containerView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.01, 0, Screen_Width*0.98, 40)];
        [_containerView setBackgroundColor:[UIColor whiteColor]];
        _containerView.layer.cornerRadius = 4;
        _containerView.layer.shadowOpacity = 0.5;
        _containerView.layer.shadowOffset = CGSizeMake(0.5, 1);
        _containerView.layer.shadowRadius = 1;
        _containerView.layer.shadowColor = [UIColor grayColor].CGColor;
        [self.contentView addSubview:_containerView];
        
        int viewwidth = _containerView.frame.size.width;
        float viewx = 0;
        int viewheight = _containerView.frame.size.height;
        int viewy = 0;
        int tagwidth = 60;
        int tagheight = 20;
        int rowpadding = (viewwidth-4*tagwidth)/5;
        int liepadding = (viewheight-1*tagheight)/2;
        
        NSInteger i = 0;
        for(i=0;i<4;i++){
            _hotlessonBtn[i] = [[UIButton alloc]initWithFrame:CGRectMake(viewx + rowpadding * (i%4+1) + (i%4) * tagwidth , viewy + liepadding * (i/4+1) + (i/4) * tagheight, tagwidth, tagheight)];
            _hotlessonBtn[i].backgroundColor = MainRedColor;
             [_hotlessonBtn[i] setTitle:@"不点名" forState:UIControlStateNormal];
            
            _hotlessonBtn[i].titleLabel.font = [UIFont systemFontOfSize:9];
            _hotlessonBtn[i].alpha = 0.65;
            _hotlessonBtn[i].titleLabel.textColor = MainWhiteColor;
            _hotlessonBtn[i].layer.cornerRadius = 4;
            _hotlessonBtn[i].layer.masksToBounds = YES;
            _hotlessonBtn[i].layer.shadowColor = [UIColor grayColor].CGColor;
            _hotlessonBtn[i].layer.shadowOffset = CGSizeMake(0.5, 1);
            _hotlessonBtn[i].tag = i + 1;//[1,12]
            _hotlessonBtn[i].showsTouchWhenHighlighted=YES;
            [_containerView addSubview:_hotlessonBtn[i]];
        }
        
        
    }
    return self;
}

@end
