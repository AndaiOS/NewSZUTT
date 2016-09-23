//
//  NotificationTableViewCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/13.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "NotificationTableViewCell.h"
#import "Masonry.h"

@interface NotificationTableViewCell(){
    UIView * _containerView;
    UIImageView * _leftImage;
    UILabel * _label;
    UIImageView * _rightImage;
}

@end

@implementation NotificationTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = MainWhiteColor;
        _containerView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.05, 0, Screen_Width*0.9, 60)];
        [_containerView setBackgroundColor:[UIColor whiteColor]];
        _containerView.layer.cornerRadius = 8;
        _containerView.layer.shadowOpacity = 1.0;
        _containerView.layer.shadowOffset = CGSizeMake(0.5, 1);
        _containerView.layer.shadowRadius = 1;
        _containerView.layer.shadowColor = [UIColor grayColor].CGColor;
        [self.contentView addSubview:_containerView];
        
        
        _leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"club_icon"]];
        [_leftImage setFrame:CGRectMake(0, _containerView.frame.origin.y + (60-60)/2, 62, 62)];
        [self.contentView addSubview:_leftImage];
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake((Screen_Width - 100)/2, 17, 100, 25)];
        _label.text = @"社团活动";
        [_label setFont:[UIFont systemFontOfSize:15]];
        _label.textColor = [UIColor grayColor];
        [_containerView addSubview:_label];
        
        _rightImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"club_more"]];
        [_rightImage setFrame:CGRectMake(Screen_Width - 35, _containerView.frame.origin.y + (60-60)/2, 35, 60)];
        [self.contentView addSubview:_rightImage];
        
    }
    return self;
}

@end
