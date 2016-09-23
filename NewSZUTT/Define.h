//
//  Define.h
//  NewSZUTT
//
//  Created by 安达 on 16/5/7.
//  Copyright © 2016年 安达. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define MainBlueColor   [UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:1];
#define MainRedColor    [UIColor colorWithRed:239.0/255 green:42.0/255 blue:42.0/255 alpha:1];
#define MainPurpleColor [UIColor colorWithRed:103.0/255 green:141.0/255 blue:245.0/255 alpha:1];
#define MainWhiteColor  [UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1];
//    78 187 228
//    101 151 231
//    222 126 164
//    154 204 99
//    161 141 218
#define LessonBlueGreenColor    [UIColor colorWithRed:78.0/255 green:187.0/255 blue:228.0/255 alpha:1];
#define LessonBlueColor         [UIColor colorWithRed:101.0/255 green:151.0/255 blue:231.0/255 alpha:1];
#define LessonRedColor          [UIColor colorWithRed:222.0/255 green:126.0/255 blue:164.0/255 alpha:1];
#define LessonGreenColor        [UIColor colorWithRed:154.0/255 green:204.0/255 blue:99.0/255 alpha:1];
#define LessonPurpleColor       [UIColor colorWithRed:161.0/255 green:141.0/255 blue:218.0/255 alpha:1];

#define dict                    [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];

#define Screen_Width    [[UIScreen mainScreen]bounds].size.width
#define Screen_Height   [[UIScreen mainScreen]bounds].size.height

#define CollegeNameArray        [[NSMutableArray alloc]initWithObjects:@"材料学院",@"传播学院",@"创业学院",@"电子信息技术学院",@"法学院",@"管理学院",@"高尔夫学院",@"化学与化工学院",@"建筑与规划设计学院",@"计算机与软件学院",@"经济学院",@"机电与控制工程学院",@"数学与计算科学学院",@"师范学院",@"生命科学学院",@"社会科学学院",@"土木工程学院",@"体育部",@"文学院",@"物理科学与技术学院",@"外国语学院",@"信息工程学院",@"艺术与设计学院",@"医学院", nil]

#define CollegeIconArray        [[NSMutableArray alloc]initWithObjects:@"cai",@"chuan",@"创业学院",@"dian",@"fa",@"guan",@"gao",@"hua",@"建筑与规划设计学院",@"ji2",@"jing",@"ji",@"shu",@"shi",@"sheng",@"she",@"tu",@"ti",@"wen",@"wai",@"wu",@"xin",@"yi2",@"yi", nil]

#define InstituteNameArray      [[NSMutableArray alloc]initWithObjects:@"MOOC",@"材料学院",@"传播学院",@"大学英语教学部",@"电子科学与技术学院",@"法学院",@"高等研究所",@"管理学院",@"光电工程学院",@"国际交流学院",@"化学与环境工程学院",@"机电与控制工程学院",@"计算机与软件学院",@"经济学院",@"建筑与城市规划学院",@"教务部",@"社会科学学院",@"生命与海洋科学学院",@"师范学院",@"数学与统计学院",@"体育部",@"图书馆",@"土木工程学院",@"外国语学院",@"文化产业研究院",@"文学院",@"武装部",@"物理与能源学院",@"校团委",@"心理与社会学院",@"信息工程学院",@"学生部",@"医学院",@"艺术设计学院",@"招生就业办公室",@"中国经济特区研究中心" nil]

#define InstituteIconArray      [[NSMutableArray alloc]initWithObjects:@"Institute_mooc",@"Institute_cai",@"Institute_spread",@"Institute_collegeenglish",@"Institute_electricity",@"Institute_law",@"Institute_research",@"Institute_manager",@"Institute_light",@"Institute_connection",@"Institute_chemistry",@"Institute_electromechanical",@"Institute_computer",@"Institute_architecture",@"Institute_economics",@"Institute_provost",@"Institute_sociology",@"Institute_life",@"Institute_teacher",@"Institute_math",@"Institute_sport",@"Institute_library",@"Institute_engineering",@"Institute_foreign",@"Institute_civilization",@"Institute_literature",@"Institute_arm",@"Institute_phycics",@"Institute_tw",@"Institute_mind",@"Institute_information",@"Institute_student",@"Institute_medical",@"Institute_art",@"Institute_zhao",@"Institute_jingyanzhongxin",nil]

#define tagArray                 @[@"不点名",@"作业少",@"不考试",@"妹子多",@"欧巴多",@"老师严",@"路程近",@"很生动",@"进度快",@"重基础",@"容易过",@"评分高"]

#define TEST_STUDENT_NUMBER      [[NSUserDefaults standardUserDefaults]objectForKey:@"number"]
#define TEST_STUDENT_PASSWORD    [[NSUserDefaults standardUserDefaults]objectForKey:@"password"]


//Alert请求参数
#define Login_Student_Number_Nil                    @"请填写学号"
#define Login_Student_Password_Nil                  @"请填写密码"
#define Login_Student_Number_ErrorFormat            @"学号格式错误"
#define Login_Student_Password_ErrorFormat          @"密码格式错误"
#define Register_Student_Number_Nil                 @"请填写学号"
#define Register_Student_Password_Nil               @"请填写密码"
#define Register_Student_Phone_Nil                  @"请填写联系方式"
#define Register_Student_Email_Nil                  @"请填写邮箱"
#define Register_Student_Number_ErrorFormat         @"学号格式错误"
#define Register_Student_Password_ErrorFormat       @"密码格式错误"
#define Register_Student_NickName_Nil               @"请填写昵称"
#define Register_Student_RealName_Nil               @"请填写姓名"




//Alert结果参数
#define Login_Student_Number_unExist              @"学号不存在"
#define Login_Student_Password_Error              @"密码错误"
#define Register_Student_Number_AlreadyExist      @"学号已注册"
#define Register_Student_NameCompareNumber_Error  @"学号姓名不匹配"
#define Register_Student_NickName_AlreadyExist    @"昵称被占用"
#define Register_Student_Phone_ErrorFormat        @"联系方式格式错误"
#define Register_Student_Email_ErrorFormat        @"邮件格式错误"

//AlertAction参数



//reason参数
#define Login_Success                       @"登录成功"
#define Register_Success                    @"注册成功"
#define Request_AllTeacher_Success          @"successed"
#define Request_LessonDetail_Success        @"successed"
#define Request_AddComment_Success          @"评论成功"

#endif /* Define_h */
