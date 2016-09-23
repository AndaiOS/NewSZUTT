//
//  LessonTableViewCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/13.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "LessonTableViewCell.h"
#import "RatingBar.h"

@interface LessonTableViewCell()<RatingBarDelegate>{
    UIImageView * _lessonNameIcon;
    UILabel * _lessonName;
    
    UIImageView * _teacherIcon;
    UILabel * _teacherName;
    
    UIImageView * _ratingIcon;
    RatingBar * _ratingBar;
    
    UIImageView * _classroomIcon;
    UILabel * _classroom;
    
    UIImageView * _dateIcon;
    UILabel * _date;
    
    UIImageView * _weekIcon;
    UILabel * _week;
    
    UIImageView * _maleIcon;
    UILabel * _male;
    
    UIImageView * _femaleIcon;
    UILabel * _female;
    
    UIImageView * _locationIcon;
    UILabel * _location;
    
    UIButton * _addLessonbtn;
    
    CABasicAnimation *animation;//立体旋转动画
    NSInteger flag;
    
    NSString * _lesson_id;
    UIAlertView * _baseAlert;
}

@end

@implementation LessonTableViewCell

-(id)init{
    if(self){
        
    }
    return self;
}

-(void)setAnimation{
    //3D立体旋转动画
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.delegate =self;
    //第一个参数是旋转的角度，第二个参数是绕x轴旋转，第三个参数是绕y轴旋转，第四个参数是绕中心点旋转
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI,0.0,0.0,1.0)];
    //执行时间
    //animation的duration为0.5，而animation2的duration为0.5*2,再设置repeatCount为2
    animation.duration = 0.5;
    animation.cumulative = YES;//累积的
    //执行次数
    animation.repeatCount = 1;
    animation.autoreverses= NO ;//是否执行逆动画
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        UIView * _containerView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.05, 0, Screen_Width * 0.9, 205)];
        [_containerView setBackgroundColor:[UIColor whiteColor]];
        _containerView.layer.cornerRadius = 8;
        _containerView.layer.shadowColor = [UIColor grayColor].CGColor;
        _containerView.layer.shadowOffset = CGSizeMake(2, 2);
        _containerView.layer.shadowOpacity = 3;
        
        _lessonNameIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lesson_purple"]];
        [_lessonNameIcon setFrame:CGRectMake(5, 10, 15, 15)];
        [_containerView addSubview:_lessonNameIcon];
        
        _lessonName = [[UILabel alloc]initWithFrame:CGRectMake(_lessonNameIcon.frame.size.width + _lessonNameIcon.frame.origin.x + 10, 10, 200, 15)];
        _lessonName.text = @"程序设计基础";
        [_lessonName setFont:[UIFont systemFontOfSize:13]];
        _lessonName.textColor = [UIColor grayColor];
        [_containerView addSubview:_lessonName];
        
        _teacherIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5,_lessonNameIcon.frame.origin.y + _lessonNameIcon.frame.size.height + 10,15,15)];
        _teacherIcon.image = [UIImage imageNamed:@"ic_person_purple"];
        [_containerView addSubview:_teacherIcon];
        
        _teacherName = [[UILabel alloc]initWithFrame:CGRectMake(_teacherIcon.frame.size.width + _teacherIcon.frame.origin.x + 10, _teacherIcon.frame.origin.y, 200, 15)];
        _teacherName.text = @"老师";
        [_teacherName setFont:[UIFont systemFontOfSize:13]];
        _teacherName.textColor = [UIColor grayColor];
        [_containerView addSubview:_teacherName];
        
        _ratingIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star_logo_purple"]];
        [_ratingIcon setFrame:CGRectMake(5, _teacherName.frame.origin.y + _teacherName.frame.size.height + 10, 15, 15)];
        _ratingBar = [[RatingBar alloc]initWithFrame:CGRectMake(_ratingIcon.frame.origin.x + 18 , _teacherName.frame.origin.y + _teacherName.frame.size.height + 10, 160, 15)];
        _ratingBar.isIndicator = YES;
        [_ratingBar setImageDeselected:@"iconfont-xingunselected" halfSelected:@"star_half" fullSelected:@"star_all" andDelegate:self];
        [_ratingBar setRating:4.5];
        [_containerView addSubview:_ratingIcon];
        [_containerView addSubview:_ratingBar];
        
        
        _classroomIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5,_ratingIcon.frame.origin.y + _ratingIcon.frame.size.height + 10,15,15)];
        _classroomIcon.image = [UIImage imageNamed:@"ic_address_purple"];
        [_containerView addSubview:_classroomIcon];
        _classroom = [[UILabel alloc]initWithFrame:CGRectMake(_classroomIcon.frame.size.width + _classroomIcon.frame.origin.x + 10, _classroomIcon.frame.origin.y, 250, 15)];
        _classroom.text = @"教学楼A205@教学楼B305";
        [_classroom setFont:[UIFont systemFontOfSize:13]];
        _classroom.textColor = [UIColor grayColor];
        [_containerView addSubview:_classroom];
        
        
        _dateIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5,_classroomIcon.frame.origin.y + _classroomIcon.frame.size.height + 10,15,15)];
        _dateIcon.image = [UIImage imageNamed:@"purple_time"];
        [_containerView addSubview:_dateIcon];
        _date = [[UILabel alloc]initWithFrame:CGRectMake(_dateIcon.frame.size.width + _dateIcon.frame.origin.x + 10, _dateIcon.frame.origin.y, 200, 15)];
        _date.text = @"周三34@周五12";
        [_date setFont:[UIFont systemFontOfSize:13]];
        _date.textColor = [UIColor grayColor];
        [_containerView addSubview:_date];
        
        _weekIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5,_dateIcon.frame.origin.y + _dateIcon.frame.size.height + 10,15,15)];
        _weekIcon.image = [UIImage imageNamed:@"calendar_purple"];
        [_containerView addSubview:_weekIcon];
        _week = [[UILabel alloc]initWithFrame:CGRectMake(_weekIcon.frame.size.width + _weekIcon.frame.origin.x + 10, _weekIcon.frame.origin.y, 100, 15)];
        _week.text = @"1~17周";
        [_week setFont:[UIFont systemFontOfSize:13]];
        _week.textColor = [UIColor grayColor];
        [_containerView addSubview:_week];
        
        _maleIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5,_weekIcon.frame.origin.y + _weekIcon.frame.size.height + 10,15,15)];
        _maleIcon.image = [UIImage imageNamed:@"male_purple"];
        [_containerView addSubview:_maleIcon];
        _male = [[UILabel alloc]initWithFrame:CGRectMake(_maleIcon.frame.size.width + _maleIcon.frame.origin.x + 10, _maleIcon.frame.origin.y, 30, 15)];
        _male.text = @"55";
        [_male setFont:[UIFont systemFontOfSize:13]];
        _male.textColor = [UIColor grayColor];
        [_containerView addSubview:_male];
        
        _femaleIcon = [[UIImageView alloc]initWithFrame:CGRectMake(_male.frame.size.width + _male.frame.origin.x + 10,_weekIcon.frame.origin.y + _weekIcon.frame.size.height + 10,15,15)];
        _femaleIcon.image = [UIImage imageNamed:@"female_button_bg"];
        [_containerView addSubview:_femaleIcon];
        _female = [[UILabel alloc]initWithFrame:CGRectMake(_femaleIcon.frame.size.width + _femaleIcon.frame.origin.x + 10, _maleIcon.frame.origin.y, 30, 15)];
        _female.text = @"25";
        [_female setFont:[UIFont systemFontOfSize:13]];
        _female.textColor = [UIColor grayColor];
        [_containerView addSubview:_female];

        _locationIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5,_maleIcon.frame.origin.y + _maleIcon.frame.size.height + 10,15,15)];
        _locationIcon.image = [UIImage imageNamed:@"location_purple"];
        [_containerView addSubview:_locationIcon];
        _location = [[UILabel alloc]initWithFrame:CGRectMake(_locationIcon.frame.size.width + _locationIcon.frame.origin.x + 10, _locationIcon.frame.origin.y, 200, 15)];
        _location.text = @"距离 187 m";
        [_location setFont:[UIFont systemFontOfSize:13]];
        _location.textColor = [UIColor grayColor];
        [_containerView addSubview:_location];
        
        _addLessonbtn = [[UIButton alloc]initWithFrame:CGRectMake(_containerView.frame.origin.x + _containerView.frame.size.width - 25 - 20, 5, 25, 25)];
        [_addLessonbtn setBackgroundImage:[UIImage imageNamed:@"add_red"] forState:UIControlStateNormal];
        [_containerView addSubview:_addLessonbtn];
        [_addLessonbtn addTarget:self action:@selector(addLesson) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:_containerView];
    }
    return self;
}
-(void)ratingBar:(RatingBar *)ratingBar ratingChanged:(float)newRating{
    
}
-(void)addLesson{
    [_addLessonbtn.layer addAnimation:animation forKey:@"animation"];
    [[HttpManager instance] requestLessonAddAudit:@{STUDENT_NUMBER:TEST_STUDENT_NUMBER, STUDENT_PASSWORD:TEST_STUDENT_PASSWORD,LESSON_ID : _lesson_id} success:^(id responseObject) {
        NSDictionary * responseDic = responseObject;
        //NSLog(@"%@",responseDic);
        //课程数据
        NSString * reason = responseDic[@"reason"];
        if([reason isEqualToString:@"添加成功"]){
            _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"添加成功！" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            
            [NSTimer scheduledTimerWithTimeInterval:0.9f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            [_baseAlert show];
            
            
            //此处加一个标记，当用户回到lesson主页的时候进行网络请求进行课表刷新
            [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"addaudit"];
        }
        else{
            _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:reason delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            
            [NSTimer scheduledTimerWithTimeInterval:0.9f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            [_baseAlert show];
        }
        NSLog(@"原因：%@",reason);
    } failure:^(NSError *error) {
        _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络出错!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
        [NSTimer scheduledTimerWithTimeInterval:0.9f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
        [_baseAlert show];
        NSLog(@"%@",error);
    }];
}
-(void)initDataWithInfo:(NSDictionary *)info{
    //NSLog(@"%@",[info valueForKey:@"title"]);
    _lesson_id = [info valueForKey:@"lesson_id"];
    _lessonName.text = [info valueForKey:@"lesson_name"];
    _teacherName.text = [info valueForKey:@"lesson_teacher_name"];
    int mark = [[info valueForKey:@"lesson_avg_comment_mark"]intValue];
    [_ratingBar setRating:mark];
    _classroom.text = [info valueForKey:@"lesson_location"];
    _date.text = [info valueForKey:@"lesson_time"];
    _week.text = [info valueForKey:@"lesson_totalweek"];
    _male.text = [info valueForKey:@"male"];
    _female.text = [info valueForKey:@"female"];
    NSString * str = [NSString stringWithFormat:@"%@米",[info valueForKey:@"lesson_distance"]];
    _location.text = str;
}
-(void) performDismiss:(NSTimer *)timer
{
    [_baseAlert dismissWithClickedButtonIndex:0 animated:NO];
}

@end
