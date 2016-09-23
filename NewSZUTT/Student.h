//
//  Student.h
//  NewSZUTT
//
//  Created by 安达 on 16/5/9.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic , strong)NSString * student_name;
@property (nonatomic , strong)NSString * student_number;
@property (nonatomic , strong)NSString * student_password;
@property (nonatomic , strong)NSString * student_nickname;
@property (nonatomic , strong)NSString * student_email;
@property (nonatomic , strong)NSString * student_phone;
@property (nonatomic , strong)NSString * student_major_name;

-(void)initStudentWithName:(NSString *)student_name student_number:(NSString *)student_number student_password:(NSString *)student_password student_nickname:(NSString *)student_nickname student_email:(NSString *)student_email student_phone:(NSString *)student_phone student_major_name:(NSString *)student_major_name;

@end
