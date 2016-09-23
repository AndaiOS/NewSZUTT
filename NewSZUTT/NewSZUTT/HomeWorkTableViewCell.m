//
//  HomeWorkTableViewCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/20.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "HomeWorkTableViewCell.h"

@interface HomeWorkTableViewCell(){
    UIView * _view;
    UILabel * _homeworkTitle;
    UILabel * _lessonName;
    UIView * _deadlineView; // 红色格子
    UILabel * _deadlineDate; // 到期时间
    UIButton * _finishedBtn; //已完成按钮
}

@end

@implementation HomeWorkTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        _view = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.01, 0, Screen_Width * 0.98, 60)];
        _view.backgroundColor = MainWhiteColor;
        _view.layer.cornerRadius = 8;
        _view.layer.backgroundColor = [UIColor whiteColor].CGColor;
        _view.layer.shadowOffset = CGSizeMake(0.5,1);
        _view.layer.shadowRadius = 1;
        _view.layer.shadowOpacity = 0.3;
        _view.layer.shouldRasterize = NO;//将负载转移CPU
        [self.contentView addSubview:_view];
        
        _homeworkTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 15)];
        _homeworkTitle.textColor = [UIColor grayColor];
        _homeworkTitle.text = @"第二章作业";
        _homeworkTitle.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_homeworkTitle];
        
        _lessonName = [[UILabel alloc]initWithFrame:CGRectMake(10, _homeworkTitle.frame.origin.y + _homeworkTitle.frame.size.height + 10, 80, 15)];
        _lessonName.textColor = [UIColor grayColor];
        _lessonName.text = @"计算机网络";
        _lessonName.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_lessonName];
        
        _deadlineView = [[UIView alloc]initWithFrame:CGRectMake(_lessonName.frame.origin.x + _lessonName.frame.size.width + 10, _lessonName.frame.origin.y, 120, 15)];
        _deadlineView.backgroundColor = MainRedColor;
        _deadlineView.layer.cornerRadius = 8;
        _deadlineView.layer.backgroundColor = [UIColor whiteColor].CGColor;
        _deadlineView.layer.shadowOffset = CGSizeMake(0.5,1);
        _deadlineView.layer.shadowRadius = 1;
        _deadlineView.layer.shadowOpacity = 0.3;
        _deadlineView.layer.shouldRasterize = NO;//将负载转移CPU
        [self.contentView addSubview:_deadlineView];
        
        _deadlineDate = [[UILabel alloc]initWithFrame:CGRectMake((120-100)/2, 0, 100, 15)];
        _deadlineDate.textColor = MainRedColor;
        _deadlineDate.text = @"到期日期 16/05/20";
        _deadlineDate.font = [UIFont systemFontOfSize:11];
        [_deadlineView addSubview:_deadlineDate];
        
        _finishedBtn = [[UIButton alloc]initWithFrame:CGRectMake(Screen_Width - 65, _deadlineView.frame.origin.y, 60, 15)];
        _finishedBtn.backgroundColor = MainRedColor;
        _finishedBtn.layer.cornerRadius = 4;
        _finishedBtn.layer.shadowColor = [UIColor grayColor].CGColor;
        _finishedBtn.titleLabel.textColor = [UIColor whiteColor];
        _finishedBtn.layer.shadowOffset = CGSizeMake(0.5,1);
        _finishedBtn.layer.shadowRadius = 1;
        _finishedBtn.layer.shadowOpacity = 0.3;
        _finishedBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_finishedBtn setTitle:@"已完成" forState:UIControlStateNormal];
        [_finishedBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_finishedBtn];
        
    }
    return self;
}
-(void)click{
    [self removeFromSuperview];
}
@end
