//
//  MyCommandTableViewCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/9.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "MyCommandTableViewCell.h"
#import "RatingBar.h"


@interface MyCommandTableViewCell()<RatingBarDelegate>{
    
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
    
    NSString * _command_id;
}

@end

@implementation MyCommandTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = [UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1];
        
        //大白框
        _view = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.05, 0, Screen_Width * 0.9, _command.frame.size.height + 150)];
        _view.backgroundColor = MainWhiteColor;
        _view.layer.cornerRadius = 2;
        _view.layer.backgroundColor = [UIColor whiteColor].CGColor;
        _view.layer.shadowOffset = CGSizeMake(0.5,1);
        _view.layer.shadowRadius = 1;
        _view.layer.shadowOpacity = 0.3;
        _view.layer.shouldRasterize = NO;//将负载转移CPU
        [self.contentView addSubview:_view];
        
        _lessonIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lesson_purple"]];
        [_lessonIcon setFrame:CGRectMake(14, 10, 15, 15)];
        _lessonName = [[UILabel alloc]initWithFrame:CGRectMake(_lessonIcon.frame.origin.x + _lessonIcon.frame.size.width + 20, 10, 160, 15)];
        _lessonName.text = @"C++程序设计基础";
        [_lessonName setFont:[UIFont systemFontOfSize:13]];
        _lessonName.textColor = [UIColor grayColor];
        
        _ratingIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star_logo_purple"]];
        [_ratingIcon setFrame:CGRectMake(14, 10+15+10, 15, 15)];
        _ratingBar = [[RatingBar alloc]initWithFrame:CGRectMake(_ratingIcon.frame.origin.x + 28 , 10+15+10, 160, 15)];
        _ratingBar.isIndicator = YES;
        [_ratingBar setImageDeselected:@"iconfont-xingunselected" halfSelected:@"star_half" fullSelected:@"star_all" andDelegate:self];
        [_ratingBar setRating:4.5];
       
        _tagIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"label_purple"]];
        [_tagIcon setFrame:CGRectMake(14, 10+15+10+15+10, 15, 15)];
        
        _dateIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"purple_time"]];
        [_dateIcon setFrame:CGRectMake(14, 10+15+10+15+10+15+10, 15, 15)];
        _date = [[UILabel alloc]initWithFrame:CGRectMake(_dateIcon.frame.size.width + _dateIcon.frame.origin.x + 20,10+15+10+15+10+15+10 , Screen_Width * 0.8, 15)];
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
        _command.text = @"他很懒，什么也没有写";
        _command.editable = NO;//不可编辑
        
        
        
//        _deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(_view.frame.origin.x + _view.frame.size.width - 25 - 15, 5, 15, 15)];
//        [_deleteButton setBackgroundImage:[UIImage imageNamed:@"deletecommand"] forState:UIControlStateNormal];
//        [_view addSubview:_deleteButton];
        
    }
    [_view addSubview:_lessonIcon];
    [_view addSubview:_lessonName];
    [_view addSubview:_ratingIcon];
    [_view addSubview:_ratingBar];
    [_view addSubview:_tagIcon];
    [_view addSubview:_commandIcon];
    [_view addSubview:_command];
    [_view addSubview:_dateIcon];
    [_view addSubview:_date];
    [self addSubview:_view];
    return self;
}
#pragma mark - RatingBar delegate
-(void)ratingBar:(RatingBar *)ratingBar ratingChanged:(float)newRating{
    if (_ratingBar == ratingBar) {
        NSLog(@"评分条的当前结果为:%.1f",newRating);
    }
}
-(void)setLessonName:(NSString *)lessonname{
    _lessonName.text = lessonname;
}
-(void)setInfo:(NSMutableDictionary *)info{
    _date.text = [info valueForKey:@"comment_time"];
    
    _command.text = [info valueForKey:@"comment_detail"];
    
    CGFloat ratingmark = [[info valueForKey:@"comment_mark"] floatValue];
    [_ratingBar setRating:ratingmark];
    
    [self setTagBtn:info key:@"teacher_tag"];
}
-(void)setDiscoverInfo:(NSDictionary *)info{
    _lessonName.text = [info valueForKey:@"lesson_name"];
    
    _date.text = [info valueForKey:@"comment_time"];
    
    _command.text = [info valueForKey:@"comment_detail"];
    
    CGFloat ratingmark = [[info valueForKey:@"comment_mark"] floatValue];
    [_ratingBar setRating:ratingmark];
    
    [self setTagBtn:info key:@"tag_array"];
    
    _command_id = [info valueForKey:@"comment_id"];
}
-(void)setTagBtn:(NSDictionary *)info key:(NSString *)key{
    NSArray * tag = [info valueForKey:key];
    int tagwidth = 35;
    int tagheight = 15;
    for(int i = 0; i< [tag count];i++){
        NSDictionary * tagdic = [tag objectAtIndex:i];
        NSString * tag_name = [tagdic valueForKey:@"teacher_tag_name"];
        _tagBtn[i] = [[UIButton alloc]initWithFrame:CGRectMake(_tagIcon.frame.origin.x + _tagIcon.frame.size.width + 20 * (i+1) + tagwidth * i, 10+15+10+15+10, tagwidth, tagheight)];
        _tagBtn[i].backgroundColor = MainBlueColor;
        //60 98 202
        //155 203 64
        _tagBtn[i].titleLabel.font = [UIFont systemFontOfSize:9];
        _tagBtn[i].alpha = 0.8;
        _tagBtn[i].titleLabel.textColor = MainWhiteColor;
        [_tagBtn[i] setTitle:tag_name forState:UIControlStateNormal];
        [_view addSubview:_tagBtn[i]];
    }
}
-(void)setComment_id:(NSString *)comment_id{
    _comment_id = comment_id;
}

@end
