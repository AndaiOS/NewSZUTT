//
//  DataBaseManager.h
//  NewSZUTT
//
//  Created by 安达 on 16/5/1.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface DataBaseManager : NSObject

+(DataBaseManager *)instance;
/*
 * 课程表字段
 */
extern NSString * lesson_id;                      //课程自增id
extern NSString * lesson_term_id;                 //课程学期号
extern NSString * lesson_institute_name;          //开课单位
extern NSString * lesson_number;                  //课程号
extern NSString * lesson_name;                    //课程名称
extern NSString * lesson_mark;                    //课程学分
extern NSString * lesson_selected_number;         //选课人数
extern NSString * lesson_limit_number;            //限选人数
extern NSString * lesson_type;                    //课程类别
extern NSString * lesson_teacher_name;            //任课老师
extern NSString * lesson_totalweek;               //上课周次
extern NSString * lesson_time;                    //上课时间
extern NSString * lesson_location;                //上课地点
extern NSString * lesson_credit_type;             //学分类别
extern NSString * lesson_tips;                    //备注
extern NSString * lesson_avg_commnet_mark;        //评分
extern NSString * lesson_male;                    //男生人数
extern NSString * lesson_female;                  //女生人数


/*
 * 学生表字段
 */
extern NSString * student_id;                     //学生号自增
extern NSString * student_major_name;             //学生专业名称
extern NSString * student_number;                 //学生学号
extern NSString * student_name;                   //学生姓名
extern NSString * student_nickname;               //学生昵称
extern NSString * student_password;               //学生密码
extern NSString * student_phone;                  //学生联系方式
extern NSString * student_email;                  //学生邮箱

/*
 * 标签表字段
 */
extern NSString * tag_id;                         //标签号自增
extern NSString * tag_name;                       //标签名称

/*
 * 老师表字段
 */
extern NSString * teacher_id;                      //老师号自增
extern NSString * teacher_name;                    //老师姓名
extern NSString * teacher_phone;                   //老师联系方式
extern NSString * teacher_address;                 //老师办公室地址
extern NSString * teacher_college;                 //老师所属学院

/*
 * 评论表字段
 */
extern NSString * comment_id;                      //评论号自增
extern NSString * comment_lesson_id;               //评论课程号
extern NSString * comment_detail;                  //评论内容
extern NSString * comment_student_number;          //评论学生号
extern NSString * comment_time;                    //评论时间
extern NSString * commnet_mark;                    //评论分数

/*
 * 位置信息字段
 */
extern NSString * location_id;                     //位置号自增
extern NSString * location_name;                   //位置名称
extern NSString * location_longitude;              //位置经度
extern NSString * location_latitude;               //位置纬度

/*
 * 老师标签字段
 */
extern NSString * teacher_tag_id;                  //老师标签号自增
extern NSString * teacher_tag_lesson_id;           //课程号
extern NSString * teacher_tag_student_number;      //学生学号
extern NSString * teacher_tag_name;                //标签名称
extern NSString * teacher_tag_comment_id;          //标签名称

/*
 * 登录成功后插入学生信息表
 */
-(void)insertStudentTable:(Student *)student;      //会判断student这张表是否被创建







@end


