//
//  DataDefines.h
//  triphare
//
//  Created by anda on 16/5/8.
//  Copyright (c) 2016年 anda. All rights reserved.
//

#ifndef                                   triphare_DataDefines_h
#define                                   triphare_DataDefines_h


//请求路径
/*
 * 登录注册界面
 */
#define URL_REGISTER                                    "http://119.29.74.202:8080/SZUTTinterface/register.spring"
#define URL_LOGIN                                       "http://119.29.74.202:8080/SZUTTinterface/login.spring"
#define URL_EMAILCODE                                   "http://119.29.74.202:8080/SZUTTinterface/emailcode.spring"
#define URL_FORGETPASSWORD                              "http://119.29.74.202:8080/SZUTTinterface/forget_password.spring"


/*
 * 课程界面
 */
#define URL_LESSON_REQUESTLESSONTIMETABLE               "http://119.29.74.202:8080/SZUTTinterface/showlesson.spring"
#define URL_LESSON_REQUESTLESSONDETAIL                  "http://119.29.74.202:8080/SZUTTinterface/get_lesson_info.spring"
#define URL_LESSON_REQUESTADDCOMMAND                    "http://119.29.74.202:8080/SZUTTinterface/add_commentandteachertag.spring"
#define URL_LESSON_REQUESTRECOMMEND                     "http://119.29.74.202:8080/SZUTTinterface/search_lesson.spring"
#define URL_LESSON_REQUESTADDAUDIT                      "http://119.29.74.202:8080/SZUTTinterface/add_audit.spring"
#define URL_LESSON_REQUESTDELETEAUDIT                   "http://119.29.74.202:8080/SZUTTinterface/del_audit.spring"


/*
 * 发现界面
 */
#define URL_DISCOVER_REQUESTTEACHERPHONE                "http://119.29.74.202:8080/SZUTTinterface/get_majorteacher.spring"
#define URL_DISCOVER_REQUESTMYCOMMAND                   "http://119.29.74.202:8080/SZUTTinterface/get_profile_allcommentandteachertag.spring"
#define URL_DISCOVER_REQUESTDELETECOMMAND               "http://119.29.74.202:8080/SZUTTinterface/del_commentandteachertag.spring"
#define URL_DISCOVER_REQUESTALLCOMMAND                  "http://119.29.74.202:8080/SZUTTinterface/get_commentandteachertag.spring"

/*
 * 我界面
 */
#define URL_PROFILE_REQUESTTTAGARRAY                    "http://119.29.74.202:8080/SZUTTinterface/get_tag.spring"
#define URL_CHANGE_PASSWORD                             "http://119.29.74.202:8080/SZUTTinterface/revise.spring"
#define URL_GET_CODEIMAGE                               "http://119.29.74.202:8080/SZUTTinterface/sendcode_secondrs_Credits_statistics.spring"
#define URL_GET_CREDITS                                 "http://119.29.74.202:8080/SZUTTinterface/statistical_credits.spring"

//json数据字段名
#define RESPONSE_KEY                  @"rs"  //响应码

//请求parameters字段名
#define STUDENT_NAME                  @"student_name"       //学生姓名
#define STUDENT_NUMBER                @"student_number"     //学生学号
#define STUDENT_PASSWORD              @"student_password"   //学生密码
#define STUDENT_NICKNAME              @"student_nickname"   //学生昵称
#define STUDENT_PHONE                 @"student_phone"      //学生联系方式
#define STUDENT_EMAIL                 @"student_email"      //学生邮箱
#define TEACHER_COLLEGE               @"teacher_college"    //学院名称
#define LESSON_ID                     @"lesson_id"          //课程号
#define TAG_NAME                      @"tag_name"           //标签组
#define COMMENT_MARK                  @"comment_mark"       //评分
#define COMMENT_DETAIL                @"comment_detail"     //评论内容
#define SEARCH_NAME                   @"search_name"        //搜索框内容
#define LONGITUDE                     @"longitude"          //经度
#define LATITUDE                      @"latitude"           //纬度
#define SEARCH_ARRAY                  @"search_array"       //选择序列
#define AUDIT_ID                      @"audit_id"           //旁听号
#define EMAILCODE                     @"code"               //验证码
#define NEW_PASSWORD                  @"new_password"       //新密码
#define AGAIN_PASSWORD                @"again_password"     //重复新密码
#define COMMENT_ID                    @"comment_id"         //评论号
#define LESSON_LOCATION               @"search_location"    //课程格子坐标
#define CREDITSCODE                   @"getcode"            //查询学分验证码

//请求参数
#define INSTITUTE_CAI                   @"材料学院"
#define INSTITUTE_SPREAD                @"传播学院"
#define INSTITUTE_START                 @"创业学院"
#define INSTITUTE_ELETRCITY             @"电子科学与技术学院"
#define INSTITUTE_LAW                   @"法学院"
#define INSTITUTE_LIGHT                 @"光电工程学院"
#define INSTITUTE_MANAGER               @"管理学院"
#define INSTITUTE_GOLF                  @"高尔夫学院"
#define INSTITUTE_CHEMISTRY             @"化学与化工学院"
#define INSTITUTE_ARCHITECTURE          @"建筑与城市规划学院"
#define INSTITUTE_COMPUTER              @"计算机与软件学院"
#define INSTITUTE_ECONOMICS             @"经济学院"
#define INSTITUTE_ELECTROMECHANICAL     @"机电与控制工程学院"
#define INSTITUTE_MATH                  @"数学与统计学院"
#define INSTITUTE_TEACHER               @"师范学院"
#define INSTITUTE_LIFE                  @"生命与海洋科学学院"
#define INSTITUTE_SOCIOLOGY             @"社会科学学院"
#define INSTITUTE_ENGINEERING           @"土木工程学院"
#define INSTITUTE_SPORTS                @"体育部"
#define INSTITUTE_LITERATURE            @"文学院"
#define INSTITUTE_PHYSICS               @"物理科学与技术学院"
#define INSTITUTE_FOREIGN               @"外国语学院"
#define INSTITUTE_MIND                  @"心理与社会学院"
#define INSTITUTE_INFORMATION           @"信息工程学院"
#define INSTITUTE_ART                   @"艺术设计学院"
#define INSTITUTE_MEDICAL               @"医学院"

#endif
