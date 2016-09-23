//
//  MyCommandTableViewCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/9.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "DiscoverCommandTableViewCell.h"
#import "RatingBar.h"


@interface DiscoverCommandTableViewCell()<RatingBarDelegate>{
    
    UIView * _view;
    
    UIImageView * _lessonIcon;
    UILabel * _lessonName;
    
    UIImageView * _ratingIcon;
    RatingBar * _ratingBar;
    
    UIImageView * _tagIcon;
    UIButton * _tagBtn[3];
    
    UIImageView * _commandIcon;
    UITextView * _command;
    
    UIImageView * _dateIcon;
    UILabel * _date;
    
    
}

@end

@implementation DiscoverCommandTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = MainWhiteColor;
        //大白框
        _view = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.05, 0, Screen_Width * 0.9, _command.frame.size.height + 150)];
        _view.backgroundColor = [UIColor whiteColor];
        _view.layer.cornerRadius = 8;
        _view.layer.backgroundColor = [UIColor whiteColor].CGColor;
        _view.layer.shadowOffset = CGSizeMake(0.5,1);
        _view.layer.shadowRadius = 1;
        _view.layer.shadowOpacity = 0.3;
        [self.contentView addSubview:_view];
        
        _lessonIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lesson_purple"]];
        [_lessonIcon setFrame:CGRectMake(14, 10, 15, 15)];
        _lessonName = [[UILabel alloc]initWithFrame:CGRectMake(_lessonIcon.frame.origin.x + _lessonIcon.frame.size.width + 20, 10, 160, 15)];
        _lessonName.text = @"C++程序设计基础";
        [_lessonName setFont:[UIFont systemFontOfSize:13]];
        _lessonName.textColor = [UIColor grayColor];
        
        _ratingIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star_logo_purple"]];
        [_ratingIcon setFrame:CGRectMake(14, 10+15+10, 15, 15)];
        
        _ratingBar = [[RatingBar alloc]initWithFrame:CGRectMake(_ratingIcon.frame.origin.x+_ratingIcon.frame.size.width + 14 , 10+15+10, 160, 15)];
        _ratingBar.isIndicator = YES;
        [_ratingBar setImageDeselected:@"iconfont-xingunselected" halfSelected:@"star_half" fullSelected:@"star_all" andDelegate:self];
        [_ratingBar setRating:3.5];
        
        _tagIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"label_purple"]];
        [_tagIcon setFrame:CGRectMake(14, 10+15+10+15+10, 15, 15)];
        
        
        int tagwidth = 35;
        int tagheight = 15;
        
        NSString * btnTitle = @"不点名";
        
        for(int i = 0; i < 3;i ++){
            _tagBtn[i] = [[UIButton alloc]initWithFrame:CGRectMake(_tagIcon.frame.origin.x + _tagIcon.frame.size.width + 20 * (i+1) + tagwidth * i, 10+15+10+15+10, tagwidth, tagheight)];
            _tagBtn[i].backgroundColor = MainBlueColor;
            [_tagBtn[i] setTitle:btnTitle forState:UIControlStateNormal];
            _tagBtn[i].titleLabel.font = [UIFont systemFontOfSize:9];
            _tagBtn[i].layer.cornerRadius = 4;
            _tagBtn[i].alpha = 0.8;
            _tagBtn[i].titleLabel.textColor = MainWhiteColor;
            [_view addSubview:_tagBtn[i]];
        }
        
        
        _dateIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"purple_time"]];
        [_dateIcon setFrame:CGRectMake(14, 10+15+10+15+10+15+10, 15, 15)];
        _date = [[UILabel alloc]initWithFrame:CGRectMake(_dateIcon.frame.size.width + _dateIcon.frame.origin.x + 20,10+15+10+15+10+15+10 , 100, 15)];
        _date.text = @"2016-04-01";
        [_date setFont:[UIFont systemFontOfSize:13]];
        _date.textColor = [UIColor grayColor];
        
        
        _commandIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"command_purple"]];
        [_commandIcon setFrame:CGRectMake(14, 10+15+10+15+10+15+10+15+10, 15, 15)];
        _command = [[UITextView alloc]initWithFrame:CGRectMake(_commandIcon.frame.origin.x + 20 + 10,
                                                               10+15+10+15+10+15+10+15, Screen_Width * 0.7, 50)];
        
        NSString * str = @"今天去听了一次课，感觉还不错，老师讲的很细不过很跳跃,第一节课讲的是C的变量，第二节课讲的是C的语法，课后肯定要自己去实现才能更好地理解，我觉得挺不错的，推荐";
        NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:str];
        _command.attributedText = attrStr;
        NSRange range = NSMakeRange(0, attrStr.length);
        NSDictionary *dic1 = [attrStr attributesAtIndex:0 effectiveRange:&range];   // 获取该段attributedString的属性字典
        // 计算文本的大小
        CGSize textSize = [_command.text boundingRectWithSize:_command.bounds.size // 用于计算文本绘制时占据的矩形块
                                                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                                   attributes:dic1        // 文字的属性
                                                      context:nil].size;
        CGRect orgrect = _command.frame;
        orgrect.size.height = textSize.height + 5;
        _command.frame = orgrect;
        _command.textColor = [UIColor grayColor];
        _command.editable = NO;//不可编辑
        
        _commandingBtn = [[UIButton alloc]initWithFrame:CGRectMake(_view.frame.origin.x + _view.frame.size.width - 25 - 20, 5, 25, 18)];
        //[_commandingBtn setBackgroundColor:[UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:1]];
        [_commandingBtn setBackgroundImage:[UIImage imageNamed:@"lesson_moredetail"] forState:UIControlStateNormal];
        _commandingBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _commandingBtn.layer.cornerRadius = 4;
        _commandingBtn.layer.shadowColor = [UIColor grayColor].CGColor;

        
        [_view addSubview:_lessonIcon];
        [_view addSubview:_lessonName];
        [_view addSubview:_ratingIcon];
        [_view addSubview:_ratingBar];
        [_view addSubview:_tagIcon];
        [_view addSubview:_commandIcon];
        [_view addSubview:_command];
        [_view addSubview:_dateIcon];
        [_view addSubview:_date];
        [_view addSubview:_commandingBtn];
        [self addSubview:_view];
    }
    return self;
}
#pragma mark - RatingBar delegate
-(void)ratingBar:(RatingBar *)ratingBar ratingChanged:(float)newRating{
    if (_ratingBar == ratingBar) {
        NSLog(@"评分条的当前结果为:%.1f",newRating);
    }
}

@end
