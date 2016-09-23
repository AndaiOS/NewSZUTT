//
//  ChangePassWordViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/9.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "ChangePassWordViewController.h"
#import "LoginViewController.h"
@interface ChangePassWordViewController(){
    UIButton * _checkButton;
    UITextField * _password1;
    UITextField * _password2;
    NSDictionary * responseDic;
    UIAlertView * _baseAlert;
}

@end

@implementation ChangePassWordViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _password1 = [[UITextField alloc]init];
    [_password1 setFrame:CGRectMake(Screen_Width * 0.0665, Screen_Height * 0.35, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _password1.textColor = [UIColor grayColor];
    _password1.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _password1.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _password1.font = [UIFont systemFontOfSize:16];
    _password1.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _password1.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _password1.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _password1.backgroundColor = [UIColor clearColor];
    _password1.placeholder = @"亲请输入新密码";
    _password1.autocorrectionType = UITextAutocorrectionTypeYes;//是否自动提示错误
    UIImageView * image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_password_icon.png"]];
    _password1.leftView = image;
    _password1.secureTextEntry = YES;//是否以密码形式展现
    
    UIView *View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image2 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _password1.frame.size.height * 0.3 / 2, 12, _password1.frame.size.height * 0.7)];
    [image2 setImage:[UIImage imageNamed:@"login_password_icon.png"]];
    [View addSubview:image2];
    _password1.leftView = View;
    _password1.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_password1];
    
    _password2 = [[UITextField alloc]init];
    [_password2 setFrame:CGRectMake(Screen_Width * 0.0665, _password1.frame.size.height + _password1.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _password2.textColor = [UIColor grayColor];
    _password2.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _password2.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _password2.font = [UIFont systemFontOfSize:16];
    _password2.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _password2.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _password2.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _password2.backgroundColor = [UIColor clearColor];
    _password2.placeholder = @"再次输入新密码";
    _password2.autocorrectionType = UITextAutocorrectionTypeYes;//是否自动提示错误
    image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_password_icon.png"]];
    _password2.leftView = image;
    _password2.secureTextEntry = YES;//是否以密码形式展现
    
    UIView *View2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image3 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _password2.frame.size.height * 0.3 / 2, 12, _password2.frame.size.height * 0.7)];
    [image3 setImage:[UIImage imageNamed:@"login_password_icon.png"]];
    [View2 addSubview:image3];
    _password2.leftView = View2;
    _password2.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_password2];
    
    
    
    _checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_checkButton setFrame:CGRectMake(Screen_Width * 0.0665, _password2.frame.size.height + _password2.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    [_checkButton setTitle:@"修改密码" forState:UIControlStateNormal];
    [_checkButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];//设置加粗
    [_checkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_checkButton addTarget:self action:@selector(clickChangePasswordBtn:) forControlEvents:UIControlEventTouchUpInside];
    _checkButton.backgroundColor = MainBlueColor;
    _checkButton.layer.masksToBounds = YES;
    _checkButton.layer.cornerRadius = (Screen_Width - 25 * 2)/90;
    [self.view addSubview:_checkButton];
}
-(void)clickChangePasswordBtn:(id)sender{
    
    if(_password1.text.length > 6){
        _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码必须为6位!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
        [NSTimer scheduledTimerWithTimeInterval:0.9f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
        [_baseAlert show];
    }
    else if(_password2.text.length > 6){
        _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码必须为6位!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
        [NSTimer scheduledTimerWithTimeInterval:0.9f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
        [_baseAlert show];
    }
    else{
        [[HttpManager instance] requestResetPassword:@{STUDENT_NUMBER:TEST_STUDENT_NUMBER, STUDENT_PASSWORD:TEST_STUDENT_PASSWORD,@"primitive_password":TEST_STUDENT_PASSWORD, @"revise_password" : _password1.text,AGAIN_PASSWORD : _password2.text} success:^(id responseObject) {
            responseDic = responseObject;
            if([responseDic[@"result"]isEqualToString:@"successed"]){
                _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"新密码设置成功!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                
                [NSTimer scheduledTimerWithTimeInterval:0.9f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
                [_baseAlert show];
                //存入新密码
                [[NSUserDefaults standardUserDefaults]setObject:_password1.text forKey:@"password"];\
                
                //在NSUserDefaults存入一个标记
                [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"clicklogout"];
                
                //消除查询学分纪录
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"had_elective_mark"];
                
                [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"already"];
                
                LoginViewController * loginVC = [[LoginViewController alloc]init];
                UINavigationController * loginNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
                [self presentViewController:loginNav animated:YES completion:nil];
                
//                [self.navigationController popToRootViewControllerAnimated:YES];//回到根视图
            }
            else{
                _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:responseDic[@"reason"] delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                
                [NSTimer scheduledTimerWithTimeInterval:0.9f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
                [_baseAlert show];
            }
        } failure:^(NSError *error) {
            _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"亲,网络出错!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            
            [NSTimer scheduledTimerWithTimeInterval:0.9f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            [_baseAlert show];
        }];
    }
}
-(void) performDismiss:(NSTimer *)timer
{
    [_baseAlert dismissWithClickedButtonIndex:0 animated:NO];
}

@end
