//
//  LessonDetailHeader.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/18.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "LessonDetailHeader.h"
#import "DoCommandViewController.h"

#define Size10              Screen_Width * 0.0313
#define Size100             Screen_Width * 0.313
#define Size65              Screen_Width * 0.203
#define Size15              Screen_Width * 0.04687
#define Size80              Screen_Width * 0.25
#define Size70              Screen_Width * 0.2187
#define Size5               Screen_Width * 0.0156
#define Size25              Screen_Width * 0.0781
#define Size705             Screen_Width * 0.0234   //7.5
#define Size250             Screen_Width * 0.781
#define Size20              Screen_Width * 0.0625
#define Size200             Screen_Width * 0.625
#define Size60              Screen_Width * 0.1875

@interface LessonDetailHeader(){
    UIView * _containerView;
    UIView * _underView;
    UIImageView * _collegeIcon;         //所属学院的Logo
    UILabel * _starCount;               //星级评分
    UILabel * _starLabel;               //星际评分标签
    UILabel * _lessonTeacher;           //老师
    UILabel * _teacherLabel;            //老师标签
    UILabel * _lessonMark;              //学分
    UILabel * _MarkLabel;               //学分标签
    UIImageView * _lessonTag1;          //所属标签
    UIImageView * _lessonTag2;          //所属标签
    UIImageView * _lessonTag3;          //所属标签
    UIButton * _more;                   //下拉anniu
    
    UIImageView * _lessonLocationIcon;  //上课地点Icon
    UILabel * _lessonName;              //课程名称
    UIImageView * _lessonNameIcon;      //课程名称Icon
    UILabel * _lessonLocation;          //上课地点
    UILabel * _lessonLocationLabel;     //上课地点标签
    UIImageView * _lessonTimeIcon;      //上课时间Icon
    UILabel * _lessonTime;              //上课时间
    UILabel * _lessonTimeLabel;         //上课时间标签
    UIImageView * _lessonWeekIcon;      //上课周数Icon
    UILabel * _lessonWeek;              //上课周数
    UILabel * _lessonWeekLabel;         //上课周数标签
    UIImageView * _maleIcon;            //男生图标
    UILabel * _male;                    //男生人数
    UIImageView * _femaleIcon;          //女生图标
    UILabel * _female;                  //女生人数
    UIImageView * _tagIcon;             //标签Icon
    UIButton * _tagBtn[3];              //标签
    
    
    CABasicAnimation *animation;       //移动动画
    
    NSInteger flag;
}

@end

@implementation LessonDetailHeader

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = MainWhiteColor;
        
        _containerView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.00, 0, Screen_Width * 1.0, Size100)];
        [_containerView setBackgroundColor:[UIColor whiteColor]];
        //_containerView.layer.cornerRadius = 2;
        _containerView.layer.shadowColor = [UIColor grayColor].CGColor;
        _containerView.layer.shadowOffset = CGSizeMake(2, 2);
        _containerView.layer.shadowOpacity = 3;
        [self insertSubview:_containerView atIndex:1];
        
        _underView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.00, 0, Screen_Width * 1.0, Size70)];
        [_underView setBackgroundColor:[UIColor whiteColor]];
        //_underView.layer.cornerRadius = 2;
        _underView.layer.shadowColor = [UIColor grayColor].CGColor;
        _underView.layer.shadowOffset = CGSizeMake(2, 2);
        _underView.layer.shadowOpacity = 3;
        [self insertSubview:_underView atIndex:0];
        
        _collegeIcon = [[UIImageView alloc]initWithFrame:CGRectMake(Size10, (Size100-Size80)/2 , Size80, Size80)];
        _collegeIcon.layer.masksToBounds = YES;
        [_containerView addSubview:_collegeIcon];
        
        
        _starCount = [[UILabel alloc]initWithFrame:CGRectMake(_collegeIcon.frame.origin.x + _collegeIcon.frame.size.width + Size10, _collegeIcon.frame.origin.y + Size5, Size65, Size15)];
        _starCount.text = @"4.0";
        _starCount.font = [UIFont systemFontOfSize:13];
        _starCount.textColor = [UIColor grayColor];
        _starCount.textAlignment = NSTextAlignmentCenter;
        [_containerView addSubview:_starCount];
        
        _starLabel = [[UILabel alloc]initWithFrame:CGRectMake(_collegeIcon.frame.origin.x + _collegeIcon.frame.size.width + Size10, _starCount.frame.origin.y + _starCount.frame.size.height + Size10, Size65, Size15)];
        _starLabel.text = @"星级评分";
        _starLabel.textColor = [UIColor grayColor];
        _starLabel.textAlignment = NSTextAlignmentCenter;
        _starLabel.font = [UIFont systemFontOfSize:13];
        [_containerView addSubview:_starLabel];
        
        _lessonTeacher = [[UILabel alloc]initWithFrame:CGRectMake(_starCount.frame.size.width + _starCount.frame.origin.x + Size10, _starCount.frame.origin.y, Size65, Size15)];
        _lessonTeacher.text = @"肖志娇";
        _lessonTeacher.textAlignment = NSTextAlignmentCenter;
        _lessonTeacher.textColor = [UIColor grayColor];
        _lessonTeacher.font = [UIFont systemFontOfSize:13];
        [_containerView addSubview:_lessonTeacher];
        
        _teacherLabel = [[UILabel alloc]initWithFrame:CGRectMake(_starLabel.frame.origin.x + _starLabel.frame.size.width + Size10, _starLabel.frame.origin.y, Size65, Size15)];
        _teacherLabel.text = @"任课老师";
        _teacherLabel.textAlignment = NSTextAlignmentCenter;
        _teacherLabel.textColor = [UIColor grayColor];
        _teacherLabel.font = [UIFont systemFontOfSize:13];
        [_containerView addSubview:_teacherLabel];
        
        _lessonMark = [[UILabel alloc]initWithFrame:CGRectMake(_lessonTeacher.frame.origin.x + _lessonTeacher.frame.size.width + Size10, _lessonTeacher.frame.origin.y, Size65, Size15)];
        _lessonMark.text = @"3.5";
        _lessonMark.textAlignment = NSTextAlignmentCenter;
        _lessonMark.textColor = [UIColor grayColor];
        _lessonMark.font = [UIFont systemFontOfSize:13];
        [_containerView addSubview:_lessonMark];
        
        _MarkLabel = [[UILabel alloc]initWithFrame:CGRectMake(_lessonMark.frame.origin.x, _teacherLabel.frame.origin.y, Size65, Size15)];
        _MarkLabel.text = @"课程学分";
        _MarkLabel.textAlignment = NSTextAlignmentCenter;
        _MarkLabel.textColor = [UIColor grayColor];
        _MarkLabel.font = [UIFont systemFontOfSize:13];
        [_containerView addSubview:_MarkLabel];
        
        _commandBtn = [[UIButton alloc]initWithFrame:CGRectMake(_starLabel.frame.origin.x, _starLabel.frame.origin.y + _starLabel.frame.size.height + Size10, Size100, Size25)];
        _commandBtn.layer.cornerRadius = 4;
        _commandBtn.backgroundColor = MainBlueColor;
        [_commandBtn setTitle:@"参与评论" forState:UIControlStateNormal];
        _commandBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_containerView addSubview:_commandBtn];
        
        _more = [[UIButton alloc]initWithFrame:CGRectMake( _commandBtn.frame.origin.x + _commandBtn.frame.size.width + Size10, _commandBtn.frame.origin.y , Size100, Size25)];
        _more.backgroundColor = MainBlueColor;
        [_more setTitle:@"更多详情" forState:UIControlStateNormal];
        _more.layer.cornerRadius = 4;
        _more.titleLabel.textColor = [UIColor whiteColor];
        _more.titleLabel.font = [UIFont systemFontOfSize:13];
        [_more addTarget:self action:@selector(clickmore) forControlEvents:UIControlEventTouchUpInside];
        [_containerView addSubview:_more];
        
        /**
         *画底下的View
         */
        
        _lessonNameIcon = [[UIImageView alloc]initWithFrame:CGRectMake(Size15, Size705, Size15, Size15)];
        [_lessonNameIcon setImage:[UIImage imageNamed:@"lesson_icon1"]];
        [_underView addSubview:_lessonNameIcon];
        _lessonName = [[UILabel alloc]initWithFrame:CGRectMake(_lessonNameIcon.frame.origin.x + _lessonNameIcon.frame.size.width + Size10, Size705, Size250, Size15)];
        _lessonName.text = @"C++程序设计基础";
        _lessonName.font = [UIFont systemFontOfSize:13];
        _lessonName.textAlignment = NSTextAlignmentLeft;
        _lessonName.textColor = [UIColor grayColor];
        [_underView addSubview:_lessonName];
        
        _lessonLocationIcon = [[UIImageView alloc]initWithFrame:CGRectMake(Size15,_lessonNameIcon.frame.origin.y + _lessonNameIcon.frame.size.height + Size10,Size15,Size15)];
        _lessonLocationIcon.image = [UIImage imageNamed:@"ic_address"];
        [_underView addSubview:_lessonLocationIcon];
        
        _lessonLocationLabel = [[UILabel alloc]initWithFrame:CGRectMake(Size10, _lessonLocationIcon.frame.origin.y, Size20, Size15)];
        _lessonLocationLabel.text = @"";
        _lessonLocationLabel.textAlignment = NSTextAlignmentCenter;
        _lessonLocationLabel.textColor = [UIColor grayColor];
        _lessonLocationLabel.font = [UIFont systemFontOfSize:13];
        [_underView addSubview:_lessonLocationLabel];
        
        _lessonLocation = [[UILabel alloc]initWithFrame:CGRectMake(_lessonLocationLabel.frame.origin.x + _lessonLocationLabel.frame.size.width + Size10, _lessonLocationLabel.frame.origin.y, Size250, Size15)];
        _lessonLocation.text = @"教学楼C405@教学楼C508";
        _lessonLocation.textAlignment = NSTextAlignmentLeft;
        _lessonLocation.textColor = [UIColor grayColor];
        _lessonLocation.font = [UIFont systemFontOfSize:13];
        [_underView addSubview:_lessonLocation];
        
        _lessonTimeIcon = [[UIImageView alloc]initWithFrame:CGRectMake(Size15,_lessonLocationIcon.frame.origin.y + _lessonLocationIcon.frame.size.height + Size10,Size15,Size15)];
        _lessonTimeIcon.image = [UIImage imageNamed:@"time"];
        [_underView addSubview:_lessonTimeIcon];
        
        _lessonTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(Size10, _lessonLocationLabel.frame.origin.y + _lessonLocationLabel.frame.size.height + Size10, Size20, Size15)];
        _lessonTimeLabel.text = @"";
        _lessonTimeLabel.textAlignment = NSTextAlignmentCenter;
        _lessonTimeLabel.textColor = [UIColor grayColor];
        _lessonTimeLabel.font = [UIFont systemFontOfSize:13];
        [_underView addSubview:_lessonTimeLabel];
        
        _lessonTime = [[UILabel alloc]initWithFrame:CGRectMake(_lessonTimeLabel.frame.origin.x + _lessonTimeLabel.frame.size.width + Size10, _lessonTimeLabel.frame.origin.y, Size200, Size15)];
        _lessonTime.text = @"周一12@周二34";
        _lessonTime.textAlignment = NSTextAlignmentLeft;
        _lessonTime.textColor = [UIColor grayColor];
        _lessonTime.font = [UIFont systemFontOfSize:13];
        [_underView addSubview:_lessonTime];
        
        _lessonWeekIcon = [[UIImageView alloc]initWithFrame:CGRectMake(Size15,_lessonTimeIcon.frame.origin.y + _lessonTimeIcon.frame.size.height + Size10,Size15,Size15)];
        _lessonWeekIcon.image = [UIImage imageNamed:@"calendar"];
        [_underView addSubview:_lessonWeekIcon];
        
        
        _lessonWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(Size10, _lessonTimeLabel.frame.origin.y + _lessonTimeLabel.frame.size.height + Size10, Size20, Size15)];
        _lessonWeekLabel.text = @"";
        _lessonWeekLabel.textAlignment = NSTextAlignmentCenter;
        _lessonWeekLabel.textColor = [UIColor grayColor];
        _lessonWeekLabel.font = [UIFont systemFontOfSize:13];
        [_underView addSubview:_lessonWeekLabel];
        
        _lessonWeek = [[UILabel alloc]initWithFrame:CGRectMake(_lessonWeekLabel.frame.origin.x + _lessonWeekLabel.frame.size.width + Size10, _lessonWeekLabel.frame.origin.y, Size60, Size15)];
        _lessonWeek.text = @"1~17周";
        _lessonWeek.textAlignment = NSTextAlignmentLeft;
        _lessonWeek.textColor = [UIColor grayColor];
        _lessonWeek.font = [UIFont systemFontOfSize:13];
        [_underView addSubview:_lessonWeek];
        
        
        _maleIcon = [[UIImageView alloc]initWithFrame:CGRectMake(_lessonWeek.frame.origin.x + _lessonWeek.frame.size.width + Size20, _lessonWeekLabel.frame.origin.y, Size15, Size15)];
        _maleIcon.image = [UIImage imageNamed:@"male_button_bg"];
        [_underView addSubview:_maleIcon];
        
        _male = [[UILabel alloc]initWithFrame:CGRectMake(_maleIcon.frame.size.width + _maleIcon.frame.origin.x + Size10, _maleIcon.frame.origin.y, Size25, Size15)];
        _male.text = @"45";
        _male.textAlignment = NSTextAlignmentLeft;
        _male.textColor = [UIColor grayColor];
        _male.font = [UIFont systemFontOfSize:13];
        [_underView addSubview:_male];
        
        _femaleIcon = [[UIImageView alloc]initWithFrame:CGRectMake(_male.frame.origin.x + _male.frame.size.width + 40, _male.frame.origin.y, Size15, Size15)];
        _femaleIcon.image = [UIImage imageNamed:@"female_button_bg"];
        [_underView addSubview:_femaleIcon];
        
        _female = [[UILabel alloc]initWithFrame:CGRectMake(_femaleIcon.frame.size.width + _femaleIcon.frame.origin.x + Size10, _femaleIcon.frame.origin.y, Size25, Size15)];
        _female.text = @"25";
        _female.textAlignment = NSTextAlignmentLeft;
        _female.textColor = [UIColor grayColor];
        _female.font = [UIFont systemFontOfSize:13];
        [_underView addSubview:_female];
        
        _tagIcon = [[UIImageView alloc]initWithFrame:CGRectMake(Size15, _lessonWeekIcon.frame.origin.y + _lessonWeekIcon.frame.size.height + Size10, Size15, Size15)];
        _tagIcon.image = [UIImage imageNamed:@"label"];
        //[_underView addSubview:_tagIcon];
        
        int tagwidth = 35;
        int tagheight = 15;
        
        NSString * btnTitle = @"不点名";
        
        for(int i = 0; i < 3;i ++){
            _tagBtn[i] = [[UIButton alloc]initWithFrame:CGRectMake(_tagIcon.frame.origin.x + _tagIcon.frame.size.width + 10 * (i+1) + tagwidth * i, _tagIcon.frame.origin.y, tagwidth, tagheight)];
            _tagBtn[i].backgroundColor = MainRedColor;
            [_tagBtn[i] setTitle:btnTitle forState:UIControlStateNormal];
            _tagBtn[i].titleLabel.font = [UIFont systemFontOfSize:9];
            _tagBtn[i].layer.cornerRadius = 4;
            _tagBtn[i].alpha = 0.8;
            _tagBtn[i].titleLabel.textColor = MainWhiteColor;
            //[_underView addSubview:_tagBtn[i]];
        }
        
        animation =[CABasicAnimation animationWithKeyPath:@"position"];
        [animation setDuration:0.6];
        
        flag = 0;//隐藏状态
        
        
    }
    return self;
}
-(CGFloat)getSize:(CGFloat)k{
    return Screen_Width * k;
}
-(void)clickmore{
    CGPoint startPoint;
    CGPoint endPoint;
    if(flag == 0){//从隐藏到展现
        startPoint = CGPointMake(Screen_Width * 0.5,0);
        endPoint = CGPointMake(Screen_Width * 0.5,_containerView.frame.origin.y + _containerView.frame.size.height + 52.5);
        flag = 1;
        [_more setTitle:@"收起详情" forState:UIControlStateNormal];
    }
    else{   //从展现到隐藏
        startPoint = CGPointMake(Screen_Width * 0.5,_containerView.frame.origin.y + _containerView.frame.size.height + 52.5);
        endPoint = CGPointMake(Screen_Width * 0.5,0);
        flag = 0;
        [_more setTitle:@"更多详情" forState:UIControlStateNormal];
    }
    [animation setFromValue:[NSValue valueWithCGPoint:startPoint]];
    [animation setToValue:[NSValue valueWithCGPoint:endPoint]];
    [_underView.layer addAnimation:animation forKey:@"animation"];
    [self didStopAnimation];
}
-(void)didStopAnimation{
    if(flag ==  1){//展现的位置
        [_underView setFrame:CGRectMake(0, _containerView.frame.origin.y + _containerView.frame.size.height, Screen_Width * 1.0, 105)];
    }
    else{
        [_underView setFrame:CGRectMake(0, -10, Screen_Width * 1.0, 105)];
    }
}
-(void)setInfo:(NSDictionary *)info{
    _lessonName.text = info[@"lesson_name"];
    _lessonTeacher.text = info[@"lesson_teacher_name"];
    _lessonMark.text = info[@"lesson_mark"];
    _starCount.text = info[@"lesson_avg_comment_mark"];
    _lessonLocation.text = info[@"lesson_location"];
    _lessonTime.text = info[@"lesson_time"];
    _male.text = info[@"lesson_male"];
    _female.text = info[@"lesson_female"];
    _lessonWeek.text = info[@"lesson_totalweek"];
    
    
    //设置学院的Icon
    NSString * lesson_institute_name = info[@"lesson_institute_name"];
    NSLog(@"%@",lesson_institute_name);
    
    NSInteger lesson_institute_id = [info[@"lesson_institute_id"]intValue];
    NSString * path = [InstituteIconArray objectAtIndex:lesson_institute_id];
    _collegeIcon.image = [UIImage imageNamed:path];
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
