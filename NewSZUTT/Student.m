//
//  Student.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/9.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void)initStudentWithName:(NSString *)student_name student_number:(NSString *)student_number student_password:(NSString *)student_password student_nickname:(NSString *)student_nickname student_email:(NSString *)student_email student_phone:(NSString *)student_phone student_major_name:(NSString *)student_major_name{
    [self setStudent_name:student_name];
    [self setStudent_nickname:student_nickname];
    [self setStudent_password:student_password];
    [self setStudent_phone:student_phone];
    [self setStudent_major_name:student_major_name];
    [self setStudent_email:student_email];
    [self setStudent_number:student_number];
}
-(void)setStudent_name:(NSString *)student_name{
    _student_name = student_name;
}
-(void)setStudent_number:(NSString *)student_number{
    _student_number = student_number;
}
-(void)setStudent_password:(NSString *)student_password{
    _student_password = student_password;
}
-(void)setStudent_nickname:(NSString *)student_nickname{
    _student_nickname = student_nickname;
}
-(void)setStudent_major_name:(NSString *)student_major_name{
    _student_major_name = student_major_name;
}
-(void)setStudent_email:(NSString *)student_email{
    _student_email = student_email;
}
-(void)setStudent_phone:(NSString *)student_phone{
    _student_phone = student_phone;
}

@end
