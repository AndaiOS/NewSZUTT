//
//  EachClubEventTableViewCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/7.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "EachClubEventTableViewCell.h"

@interface EachClubEventTableViewCell(){
    UIView * _view;
    UILabel * _titleLabel;//活动标题
    UILabel * _date;      //活动时间
    UIImageView * _image; //活动图片
    UILabel * _description;//活动描述
    
    UIView * _line;
    UILabel * _readAll;
    UILabel * _moreIcon;
    //活动名称  第六届深大杯桌球挑战赛
    //活动时间  2016.5.7
    //活动地点  枪手桌球俱乐部
    //活动语言  敢，就来挑战!
    
}

@end

@implementation EachClubEventTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = MainWhiteColor;
        //大白框
        _view = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.05, 0, Screen_Width * 0.9, Screen_Height * 0.5)];
        _view.backgroundColor = [UIColor whiteColor];
        _view.layer.cornerRadius = 4;
        _view.layer.backgroundColor = [UIColor whiteColor].CGColor;
        _view.layer.shadowOffset = CGSizeMake(0.5,1);
        _view.layer.shadowRadius = 1;
        _view.layer.shadowOpacity = 0.3;
        [self.contentView addSubview:_view];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_view.frame.origin.x + 10, 5, Screen_Width * 0.8, 20)];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.text = @"深大杯桌球公开赛八球开赛了!";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_titleLabel];
        
        _date = [[UILabel alloc]initWithFrame:CGRectMake(_view.frame.origin.x + 10, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 5, Screen_Width * 0.4, 10)];
        _date.textColor = [UIColor grayColor];
        _date.text = @"05-18";
        _date.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:_date];
        
        _image = [[UIImageView alloc]initWithFrame:CGRectMake(_view.frame.origin.x + 10, _date.frame.origin.y + _date.frame.size.height + 10, _view.frame.size.width * 0.93, Screen_Height * 0.26)];
        _image.image = [UIImage imageNamed:@"img0.jpg"];
        _image.layer.cornerRadius = 2;
        _image.layer.masksToBounds = YES;
        [self.contentView addSubview:_image];
        
        _description = [[UILabel alloc]initWithFrame:CGRectMake(_view.frame.origin.x + 10, _image.frame.origin.y + _image.frame.size.height + 20, Screen_Width * 0.9, 10)];
        _description.textColor = [UIColor grayColor];
        _description.lineBreakMode = NSLineBreakByWordWrapping;
        _description.text = @"八球比赛小组出线名单已出!斯诺克也将决出冠军!";
        _description.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_description];
        
        _line = [[UIView alloc]initWithFrame:CGRectMake( _view.frame.origin.x + 10 , _description.frame.origin.y + _description.frame.size.height + 15 ,_view.frame.size.width * 0.93 , 1)];
        [_line setBackgroundColor:[UIColor colorWithRed:225.0/255 green:225.0/255 blue:225.0/255 alpha:0.5]];
        [self.contentView addSubview:_line];
        
        _readAll = [[UILabel alloc]initWithFrame:CGRectMake(_view.frame.origin.x + 10, _line.frame.origin.y + _line.frame.size.height + 12, Screen_Width * 0.4, 10)];
        _readAll.textColor = [UIColor grayColor];
        _readAll.text = @"阅读全文";
        _readAll.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_readAll];
    
        _moreIcon = [[UILabel alloc]initWithFrame:CGRectMake(_line.frame.origin.x + _line.frame.size.width - 10, _line.frame.origin.y + 10, 15, 15)];
        _moreIcon.textColor = [UIColor grayColor];
        _moreIcon.text = @"》";
        _moreIcon.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_moreIcon];
        
        
    
    }
    return self;
}

@end
