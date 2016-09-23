//
//  LoginViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/3/30.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "LessonViewController.h"
#import "AlertViewController.h"
#import "DiscoverViewController.h"
#import "LessonViewController.h"
#import "ProfileViewController.h"
#import "Student.h"
#import "MD5.h"
#import "ForgetPasswordViewController.h"

#define TABLE_WITH_ICON_SEPARATORINSET_LEFT_INSET  45
#define LOGIN_TABLEVIEW_Margin 25

@interface LoginViewController (){
    UITextField * _stuidtextField;
    UITextField * _passwordtextField;
    UIImageView * _logo;
    UIButton * _loginBtn;
    UIButton * _registerBtn;
    UIButton * _forgetpasswordBtn;
    UIAlertController * alert;
    UIAlertAction * defaultAction;
    UIAlertView * _baseAlert;
    
    UIButton * _checkBox; //自动登录
    UILabel * _checkBoxLabel;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    self.navigationController.navigationBar.titleTextAttributes = dict;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //自然而然的显示
    [self initView];
    [self checkUser];
    // Do any additional setup after loading the view.
}
-(void)initView{
    _logo = [[UIImageView alloc]initWithFrame:CGRectMake(Screen_Width/3, 104, Screen_Width/3, Screen_Width/3/2.74)];
    _logo.image = [UIImage imageNamed:@"SZUTT_logo.png"];
    [self.view addSubview:_logo];
    
    _stuidtextField = [[UITextField alloc]init];
    [_stuidtextField setFrame:CGRectMake(Screen_Width * 0.0665, _logo.frame.size.height + _logo.frame.origin.y + 45, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _stuidtextField.textColor = [UIColor grayColor];
    _stuidtextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _stuidtextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _stuidtextField.font = [UIFont systemFontOfSize:16];
    _stuidtextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的删除符号，在编辑时出现
    _stuidtextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _stuidtextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _stuidtextField.backgroundColor = [UIColor clearColor];
    _stuidtextField.placeholder = @"亲你的学号";
    UIView *View1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image1 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _stuidtextField.frame.size.height * 0.45 / 2, 12, _stuidtextField.frame.size.height * 0.55)];
    [image1 setImage:[UIImage imageNamed:@"login_nick_icon.png"]];
    [View1 addSubview:image1];
    _stuidtextField.leftView = View1;
    _stuidtextField.leftViewMode = UITextFieldViewModeAlways;
    _stuidtextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_stuidtextField];
    
    
    _passwordtextField = [[UITextField alloc]init];
    [_passwordtextField setFrame:CGRectMake(Screen_Width * 0.0665, _stuidtextField.frame.size.height + _stuidtextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _passwordtextField.textColor = [UIColor grayColor];
    _passwordtextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _passwordtextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _passwordtextField.font = [UIFont systemFontOfSize:16];
    _passwordtextField.secureTextEntry = YES;
    _passwordtextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的删除符号，在编辑时出现
    _passwordtextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _passwordtextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _passwordtextField.backgroundColor = [UIColor clearColor];
    _passwordtextField.placeholder = @"别忘了密码哦";
    _passwordtextField.keyboardType = UIKeyboardTypeNumberPad;
    
    
    UIView *View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image2 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _passwordtextField.frame.size.height * 0.35 / 2, 12, _passwordtextField.frame.size.height * 0.65)];
    [image2 setImage:[UIImage imageNamed:@"login_password_icon.png"]];
    [View addSubview:image2];
    _passwordtextField.leftView = View;
    _passwordtextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_passwordtextField];
    
    //_checkBox = [[UIButton alloc]initWithFrame:CGRectMake(_passwordtextField.frame.origin.x, _passwordtextField.frame.origin.y + _passwordtextField.frame.size.height + 15, 20, 20)];
//    [_checkBox setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
//    _checkBox.layer.borderWidth = 0.4;
//    _checkBox.layer.borderColor = [UIColor grayColor].CGColor;
//    _checkBox.layer.cornerRadius = 4;
//    //设置正常时图片为    check_off.png
//    [_checkBox setImage:[UIImage imageNamed:@"checkbox"]forState:UIControlStateSelected];
//    [_checkBox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_checkBox];
//    
//    _checkBoxLabel = [[UILabel alloc]initWithFrame:CGRectMake(_checkBox.frame.size.width + _checkBox.frame.origin.x + 15, _checkBox.frame.origin.y, 100, 20)];
//    _checkBoxLabel.text = @"自动登录";
//    _checkBoxLabel.textColor = [UIColor grayColor];
//    _checkBoxLabel.font = [UIFont systemFontOfSize:13];
//    [self.view addSubview:_checkBoxLabel];
    
    //此处报过错：unsafe to initwithframe
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBtn setFrame:CGRectMake(Screen_Width * 0.0665, _passwordtextField.frame.size.height + _passwordtextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    [_loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
    [_loginBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];//设置加粗
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(Login:) forControlEvents:UIControlEventTouchUpInside];
    _loginBtn.backgroundColor = MainBlueColor;
    _loginBtn.layer.masksToBounds = YES;
    _loginBtn.layer.cornerRadius = (Screen_Width - LOGIN_TABLEVIEW_Margin * 2)/90;
    [self.view addSubview:_loginBtn];
    
    _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_registerBtn setFrame:CGRectMake(_loginBtn.frame.origin.x, _loginBtn.frame.size.height + _loginBtn.frame.origin.y + 15, Screen_Width * 0.24, Screen_Height * 0.0195)];
    [_registerBtn setTitle:@"亲注册一个" forState:UIControlStateNormal];
    [_registerBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [_registerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_registerBtn addTarget:self action:@selector(Register:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerBtn];
    
    _forgetpasswordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_forgetpasswordBtn setFrame:CGRectMake(_loginBtn.frame.size.width + _loginBtn.frame.origin.x - Screen_Width * 0.2036, _loginBtn.frame.size.height + _loginBtn.frame.origin.y + 15, Screen_Width * 0.2036, Screen_Height * 0.0195)];
    [_forgetpasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [_forgetpasswordBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [_forgetpasswordBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_forgetpasswordBtn addTarget:self action:@selector(ForgetPassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_forgetpasswordBtn];
}


//收起输入框
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![_stuidtextField isExclusiveTouch]) {
        [_stuidtextField resignFirstResponder];
    }
    if (![_passwordtextField isExclusiveTouch]) {
        [_passwordtextField resignFirstResponder];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidHide) name:UIKeyboardDidHideNotification object:nil];
    
    self.navigationController.navigationBar.barTintColor = MainBlueColor;
}
-(void)keyboardDidShow{
    
}
-(void)keyboardDidHide{
    
}
//登陆方法
-(void)Login:(id)sender{
    
    NSString * student_number = _stuidtextField.text;
    NSString * student_password = _passwordtextField.text;
    
    if(student_number.length == 0){
        [self setTitle:@"提示" setMessage:Login_Student_Number_Nil setActionTitle:@"好的"];
    }
    else if(student_password == 0){
        [self setTitle:@"提示" setMessage:Login_Student_Password_Nil setActionTitle:@"好的"];
    }
    else{
        [self RequestLogin];
    }
}
-(void)checkUser{//自动登录

}
-(void)RequestLogin{
    NSString * student_number = [[NSString alloc]init];
    NSString * student_password = [[NSString alloc]init];
    
    student_number = _stuidtextField.text;
    student_password = _passwordtextField.text;
    
    [[HttpManager instance] requestLogin:@{STUDENT_NUMBER:student_number, STUDENT_PASSWORD:student_password} success:^(id responseObject) {
        NSDictionary * responseDic = responseObject;
        NSLog(@"%@",responseDic);
        NSString * reason = responseDic[@"reason"];
        NSLog(@"%@",reason);
        
        if([reason isEqualToString:Login_Student_Number_unExist]){
            [self setTitle:@"警告" setMessage:Login_Student_Number_unExist setActionTitle:@"知道了"];
        }
        else if([reason isEqualToString:Login_Student_Password_Error]){
            [self setTitle:@"警告" setMessage:Login_Student_Password_Error setActionTitle:@"知道了"];
        }
        else{//登录成功
            
            //重新写入logout
            [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"clicklogout"];
            
            NSString * student_number = responseDic[@"number"];
            NSString * student_password = responseDic[@"password"];
            NSString * student_nickname = responseDic[@"nickname"];
            NSString * student_name = responseDic[@"name"];
            
            [[NSUserDefaults standardUserDefaults] setObject:student_number forKey:@"number"
             ];
            [[NSUserDefaults standardUserDefaults] setObject:student_password forKey:@"password"
             ];
            [[NSUserDefaults standardUserDefaults]setObject:student_name forKey:@"name"];
            [[NSUserDefaults standardUserDefaults]setObject:student_nickname forKey:@"nickname"];
            
            
            _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"登录成功" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            [_baseAlert show];
            
            [_stuidtextField resignFirstResponder];
            [_passwordtextField resignFirstResponder];
            
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            LessonViewController *lessonVC = [[LessonViewController alloc]init];
            lessonVC.title = @"课程";
            lessonVC.tabBarItem.image = [[UIImage imageNamed:@"home_toolbar_fresh_icon.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            lessonVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_toolbar_fresh_icon_selected_meitu.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.lessonNav = [[UINavigationController alloc] initWithRootViewController:lessonVC];
            
            DiscoverViewController *discoverVC = [[DiscoverViewController alloc]init];
            discoverVC.title = @"发现";
            discoverVC.tabBarItem.image = [[UIImage imageNamed:@"home_toolbar_discover_icon.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            discoverVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_toolbar_discover_icon_selected_meitu.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.discoverNav = [[UINavigationController alloc] initWithRootViewController:discoverVC];
            
            ProfileViewController *profileVC = [[ProfileViewController alloc]init];
            profileVC.title = @"我";
            profileVC.tabBarItem.image = [[UIImage imageNamed:@"home_toolbar_me_icon.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            profileVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_toolbar_me_icon_selected_meitu.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.profileNav = [[UINavigationController alloc] initWithRootViewController:profileVC];
            
            self.tabBarController = [[UITabBarController alloc] init];
            self.tabBarController.viewControllers = @[self.lessonNav, self.discoverNav,self.profileNav];
            
            self.window.rootViewController = self.tabBarController;
            [self.window makeKeyAndVisible];
            
            
        }
        //        NSData * data = [NSJSONSerialization dataWithJSONObject:responseDic options:NSJSONWritingPrettyPrinted error:nil];
        //        NSString * jsonString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"%@",jsonString);
    } failure:^(NSError *error) {
        [self setTitle:@"提示" setMessage:@"网络出错!" setActionTitle:@"知道了"];
        [self viewDidAppear:YES];
        NSLog(@"%@",error);
    }];
}
-(void)checkboxClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if(btn.selected == true){
        _checkBox.layer.borderWidth = 0;
        [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"clicklogout"];
    }
    else{
        _checkBox.layer.borderWidth = 0.4;
        [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"clicklogout"];
    }
}
//忘记密码
-(void)ForgetPassword:(id)sender{
    ForgetPasswordViewController * forgetVC = [[ForgetPasswordViewController alloc]init];
    [self.navigationController pushViewController:forgetVC animated:YES];
}
//注册方法
-(void)Register:(id)sender{
    RegisterViewController * registerVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
}
-(void)setTitle:(NSString *)title setMessage:(NSString *)message setActionTitle:(NSString *)actiontitle{
    alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    defaultAction = [UIAlertAction actionWithTitle:actiontitle style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) performDismiss:(NSTimer *)timer
{
    [_baseAlert dismissWithClickedButtonIndex:0 animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
