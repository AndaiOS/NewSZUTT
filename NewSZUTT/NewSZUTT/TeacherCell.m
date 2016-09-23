//
//  TeacherCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/13.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "TeacherCell.h"

@interface TeacherCell(){
    UILabel * _label;
    UIImageView * _collegeIcon;
    UIImageView * _rightImg;
    UIView * _containerView;
    NSString * _labelText;
}

@end

@implementation TeacherCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = MainWhiteColor;
        _containerView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.01, 0, Screen_Width*0.98, 40)];
        [_containerView setBackgroundColor:[UIColor whiteColor]];
        _containerView.layer.cornerRadius = 8;
        _containerView.layer.shadowOpacity = 0.5;
        _containerView.layer.shadowOffset = CGSizeMake(0.5, 1);
        _containerView.layer.shadowRadius = 1;
        _containerView.layer.shadowColor = [UIColor grayColor].CGColor;
        [self.contentView addSubview:_containerView];
        
        _collegeIcon = [[UIImageView alloc]initWithFrame:CGRectMake(10, (40-20)/2, 20, 20)];
        _collegeIcon.image = [UIImage imageNamed:@"lesson_icon1"];
        [_containerView addSubview:_collegeIcon];
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(40, (40-25)/2, 200, 25)];
        _label.text = @"计算机与软件学院";
        [_label setFont:[UIFont systemFontOfSize:13]];
        _label.textColor = [UIColor grayColor];
        [_containerView addSubview:_label];
        
        _rightImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"club_more"]];
        [_rightImg setFrame:CGRectMake(Screen_Width - 25 , 0, 25, 40)];
        [self.contentView addSubview:_rightImg];
        
    }
    return self;
}
-(void)setText{
    
}

@end
