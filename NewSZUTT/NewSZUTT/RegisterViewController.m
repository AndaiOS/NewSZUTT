//
//  RegisterViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/3/31.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"

#define TABLE_WITH_ICON_SEPARATORINSET_LEFT_INSET  45
#define LOGIN_TABLEVIEW_Margin 25
@interface RegisterViewController ()<UITextFieldDelegate>{
    UIImageView * _maleIcon;                //男性Icon
    UIImageView * _femaleIcon;              //女性Icon
    UITextField * _stuidTextField;          //学号输入框
    UITextField * _realnameTextField;       //真实姓名输入框
    UITextField * _nicknameTextField;       //昵称输入框
    UITextField * _passwordTextField;       //密码输入框
    UITextField * _phoneTextField;          //联系方式输入框
    UITextField * _emailTextField;          //邮件输入框
    UIButton * _registerBtn;
    UIButton * _loginBtn;
    
    UIAlertController * _alert;
    UIAlertAction * _defaultAction;
    
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _maleIcon = [[UIImageView alloc]initWithFrame:CGRectMake(Screen_Width/3, 84, Screen_Width/8, Screen_Width/8)];
    _maleIcon.image = [UIImage imageNamed:@"male_button_bg.png"];
    [self.view addSubview:_maleIcon];
    
    _femaleIcon = [[UIImageView alloc]initWithFrame:CGRectMake(_maleIcon.frame.origin.x + _maleIcon.frame.size.width + Screen_Width/12.5, 84, Screen_Width/8, Screen_Width/8)];
    _femaleIcon.image = [UIImage imageNamed:@"female_button_bg.png"];
    [self.view addSubview:_femaleIcon];
    
    _stuidTextField = [[UITextField alloc]init];
    [_stuidTextField setFrame:CGRectMake(Screen_Width * 0.0665, _maleIcon.frame.size.height + _maleIcon.frame.origin.y + 45, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _stuidTextField.textColor = [UIColor grayColor];
    _stuidTextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _stuidTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _stuidTextField.font = [UIFont systemFontOfSize:16];
    _stuidTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _stuidTextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _stuidTextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _stuidTextField.backgroundColor = [UIColor clearColor];
    _stuidTextField.placeholder = @"亲你的学号";
    UIView *View1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image1 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _stuidTextField.frame.size.height * 0.45 / 2, 12, _stuidTextField.frame.size.height * 0.55)];
    [image1 setImage:[UIImage imageNamed:@"login_nick_icon.png"]];
    [View1 addSubview:image1];
    _stuidTextField.leftView = View1;
    _stuidTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_stuidTextField];
    
    _realnameTextField = [[UITextField alloc]init];
    [_realnameTextField setFrame:CGRectMake(Screen_Width * 0.0665, _stuidTextField.frame.size.height + _stuidTextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _realnameTextField.textColor = [UIColor grayColor];
    _realnameTextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _realnameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _realnameTextField.font = [UIFont systemFontOfSize:16];
    _realnameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _realnameTextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _realnameTextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _realnameTextField.backgroundColor = [UIColor clearColor];
    _realnameTextField.placeholder = @"真实姓名";
    UIView *View2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image2 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _stuidTextField.frame.size.height * 0.45 / 2, 12, _stuidTextField.frame.size.height * 0.55)];
    [image2 setImage:[UIImage imageNamed:@"login_nick_icon.png"]];
    [View2 addSubview:image2];
    _realnameTextField.leftView = View2;
    [self.view addSubview:_realnameTextField];
    
    _nicknameTextField = [[UITextField alloc]init];
    [_nicknameTextField setFrame:CGRectMake(Screen_Width * 0.0665, _realnameTextField.frame.size.height + _realnameTextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _nicknameTextField.textColor = [UIColor grayColor];
    _nicknameTextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _nicknameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _nicknameTextField.font = [UIFont systemFontOfSize:16];
    _nicknameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _nicknameTextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _nicknameTextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _nicknameTextField.backgroundColor = [UIColor clearColor];
    _nicknameTextField.placeholder = @"口爱的昵称";
    UIView *View3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image3 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _stuidTextField.frame.size.height * 0.45 / 2, 12, _stuidTextField.frame.size.height * 0.55)];
    [image3 setImage:[UIImage imageNamed:@"login_nick_icon.png"]];
    [View3 addSubview:image3];
    _nicknameTextField.leftView = View3;
    [self.view addSubview:_nicknameTextField];
    
    _passwordTextField = [[UITextField alloc]init];
    [_passwordTextField setFrame:CGRectMake(Screen_Width * 0.0665, _nicknameTextField.frame.size.height + _nicknameTextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _passwordTextField.textColor = [UIColor grayColor];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _passwordTextField.font = [UIFont systemFontOfSize:16];
    _passwordTextField.secureTextEntry = YES;//密码模式
    _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _passwordTextField.backgroundColor = [UIColor clearColor];
    _passwordTextField.placeholder = @"6位纯数字密码~";
    _passwordTextField.delegate = self;
    UIView *View4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image4 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _stuidTextField.frame.size.height * 0.45 / 2, 12, _stuidTextField.frame.size.height * 0.55)];
    [image4 setImage:[UIImage imageNamed:@"login_nick_icon.png"]];
    [View4 addSubview:image4];
    _passwordTextField.leftView = View4;
    [self.view addSubview:_passwordTextField];
    
    _phoneTextField = [[UITextField alloc]init];
    [_phoneTextField setFrame:CGRectMake(Screen_Width * 0.0665, _passwordTextField.frame.size.height + _passwordTextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _phoneTextField.textColor = [UIColor grayColor];
    _phoneTextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _phoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _phoneTextField.font = [UIFont systemFontOfSize:16];
    _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _phoneTextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _phoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _phoneTextField.backgroundColor = [UIColor clearColor];
    _phoneTextField.placeholder = @"联系方式～";
    _phoneTextField.delegate = self;
    UIView *View5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image5 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _stuidTextField.frame.size.height * 0.45 / 2, 12, _stuidTextField.frame.size.height * 0.55)];
    [image5 setImage:[UIImage imageNamed:@"login_nick_icon.png"]];
    [View5 addSubview:image5];
    _phoneTextField.leftView = View5;
    [self.view addSubview:_phoneTextField];
    
    _emailTextField = [[UITextField alloc]init];
    [_emailTextField setFrame:CGRectMake(Screen_Width * 0.0665, _phoneTextField.frame.size.height + _phoneTextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _emailTextField.textColor = [UIColor grayColor];
    _emailTextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _emailTextField.font = [UIFont systemFontOfSize:16];
    _emailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _emailTextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _emailTextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _emailTextField.backgroundColor = [UIColor clearColor];
    _emailTextField.placeholder = @"邮箱～";
    _emailTextField.delegate = self;
    UIView *View6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image6 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _stuidTextField.frame.size.height * 0.45 / 2, 12, _stuidTextField.frame.size.height * 0.55)];
    [image6 setImage:[UIImage imageNamed:@"login_nick_icon.png"]];
    [View6 addSubview:image6];
    _emailTextField.leftView = View6;
    [self.view addSubview:_emailTextField];


    
    _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_registerBtn setFrame:CGRectMake(Screen_Width * 0.0665, _emailTextField.frame.size.height + _emailTextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    [_registerBtn setTitle:@"填好了" forState:UIControlStateNormal];
    [_registerBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];//设置加粗
    [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_registerBtn addTarget:self action:@selector(clickRegisterBtn:) forControlEvents:UIControlEventTouchUpInside];
    _registerBtn.backgroundColor = [UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:1];
    _registerBtn.layer.masksToBounds = YES;
    _registerBtn.layer.cornerRadius = (Screen_Width - LOGIN_TABLEVIEW_Margin * 2)/90;
    [self.view addSubview:_registerBtn];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBtn setFrame:CGRectMake(_registerBtn.frame.origin.x, _registerBtn.frame.size.height + _registerBtn.frame.origin.y + 15, Screen_Width * 0.15, Screen_Height * 0.0195)];
    [_loginBtn setTitle:@"去登录" forState:UIControlStateNormal];
    [_loginBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [_loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(clickLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)clickRegisterBtn:(id)sender{
    
    NSString * student_number = _stuidTextField.text;
    NSString * student_name = _realnameTextField.text;
    NSString * student_nickname = _nicknameTextField.text;
    NSString * student_password = _passwordTextField.text;
    NSString * student_phone = _phoneTextField.text;
    NSString * student_email = _emailTextField.text;
    
    if(student_number.length == 0){
        [self setTitle:@"提示" setMessage:Register_Student_Number_Nil setActionTitle:@"好的"];
    }
    else if(student_number.length != 10){
        [self setTitle:@"提示" setMessage:Register_Student_Number_ErrorFormat setActionTitle:@"好的"];
    }
    else if(student_password.length == 0){
        [self setTitle:@"提示" setMessage:Register_Student_Password_Nil setActionTitle:@"好的"];
    }
    else if(student_password.length != 6){
        [self setTitle:@"提示" setMessage:Register_Student_Password_ErrorFormat setActionTitle:@"好的"];
    }
    else if(student_nickname.length == 0){
        [self setTitle:@"提示" setMessage:Register_Student_NickName_Nil setActionTitle:@"好的"];
    }
    else if(student_name.length == 0){
        [self setTitle:@"提示" setMessage:Register_Student_RealName_Nil setActionTitle:@"好的"];
    }
    else{
        [[HttpManager instance] requestRegister:
                @{STUDENT_NUMBER:student_number, STUDENT_NAME:student_name ,STUDENT_NICKNAME : student_nickname , STUDENT_PASSWORD:student_password , STUDENT_PHONE : student_phone,STUDENT_EMAIL : student_email} success:^(id responseObject) {
            NSDictionary * responseDic = responseObject;
            NSLog(@"%@",responseDic);
            NSString * reason = responseDic[@"reason"];
            NSLog(@"%@",reason);
            if([reason isEqualToString:Register_Success]){//注册成功
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
            else{
                [self setTitle:@"提示" setMessage:reason setActionTitle:@"知道了"];
            }
        } failure:^(NSError *error) {
            [self setTitle:@"提示" setMessage:@"网络出错!" setActionTitle:@"知道了"];
            NSLog(@"%@",error);
        }];
    }
}
-(void)setTitle:(NSString *)title setMessage:(NSString *)message setActionTitle:(NSString *)actiontitle{
    _alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    _defaultAction = [UIAlertAction actionWithTitle:actiontitle style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action) {}];
    [_alert addAction:_defaultAction];
    [self presentViewController:_alert animated:YES completion:nil];
}

-(void)clickLoginBtn:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    CGFloat offset = self.view.frame.size.height - (textField.frame.origin.y + textField.frame.size.height + 216 + 50);
//    
//    if(offset <= 0){
//        [UIView animateWithDuration:0.3 animations:^{
//            CGRect frame = self.view.frame;
//            frame.origin.y = offset;
//            self.view.frame = frame;
//        }];
//    }
//    return  YES;
//}
//收起输入框
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![_passwordTextField isExclusiveTouch]) {
        [_passwordTextField resignFirstResponder];
    }
    if (![_stuidTextField isExclusiveTouch]) {
        [_stuidTextField resignFirstResponder];
    }
    if (![_nicknameTextField isExclusiveTouch]) {
        [_nicknameTextField resignFirstResponder];
    }
    if (![_realnameTextField isExclusiveTouch]) {
        [_realnameTextField resignFirstResponder];
    }
    if (![_phoneTextField isExclusiveTouch]) {
        [_phoneTextField resignFirstResponder];
    }
    if (![_emailTextField isExclusiveTouch]) {
        [_emailTextField resignFirstResponder];
    }
    
}




//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
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
