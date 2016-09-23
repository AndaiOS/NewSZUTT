//
//  ForgetPasswordViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/16.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController()<UITextFieldDelegate>{
    UIImageView * _image;
    UITextField * _stuidTextField;
    UITextField * _emailTextField;
    UITextField * _codeTextField;
    UIButton * _sendcodeBtn;
    
    UITextField * _passwordTextField;
    UITextField * _passwordTextFieldrevise;
    UIButton * _sureBtn;
    UIAlertView * _baseAlert;
}

@end


@implementation ForgetPasswordViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = MainWhiteColor;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Width * 0.2789)];
    _image.image = [UIImage imageNamed:@"notfound"];
    [self.view addSubview:_image];
    
    _stuidTextField = [[UITextField alloc]init];
    [_stuidTextField setFrame:CGRectMake(Screen_Width * 0.0665, _image.frame.size.height + _image.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
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
    
    _emailTextField = [[UITextField alloc]init];
    [_emailTextField setFrame:CGRectMake(Screen_Width * 0.0665, _stuidTextField.frame.origin.y + _stuidTextField.frame.size.height + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _emailTextField.textColor = [UIColor grayColor];
    _emailTextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _emailTextField.font = [UIFont systemFontOfSize:16];
    _emailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _emailTextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _emailTextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _emailTextField.backgroundColor = [UIColor clearColor];
    _emailTextField.placeholder = @"亲你的邮箱";
    UIView *View2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image2 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _emailTextField.frame.size.height * 0.45 / 2, 12, _emailTextField.frame.size.height * 0.55)];
    [image2 setImage:[UIImage imageNamed:@"login_nick_icon.png"]];
    [View2 addSubview:image2];
    _emailTextField.leftView = View2;
    _emailTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_emailTextField];
    
    _codeTextField = [[UITextField alloc]init];
    [_codeTextField setFrame:CGRectMake(Screen_Width * 0.0665, _emailTextField.frame.size.height + _emailTextField.frame.origin.y + 15, Screen_Width * 0.567, Screen_Height * 0.0599)];
    _codeTextField.textColor = [UIColor grayColor];
    _codeTextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _codeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _codeTextField.font = [UIFont systemFontOfSize:16];
    _codeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _codeTextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _codeTextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _codeTextField.backgroundColor = [UIColor clearColor];
    _codeTextField.placeholder = @"验证码";
    _codeTextField.delegate = self;
    UIView *View3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image3 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _stuidTextField.frame.size.height * 0.45 / 2, 12, _stuidTextField.frame.size.height * 0.55)];
    [image3 setImage:[UIImage imageNamed:@"login_nick_icon.png"]];
    [View3 addSubview:image3];
    _codeTextField.leftView = View3;
    [self.view addSubview:_codeTextField];
    
    _sendcodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sendcodeBtn setFrame:CGRectMake(_stuidTextField.frame.size.width + _stuidTextField.frame.origin.x - Screen_Width * 0.267, _codeTextField.frame.origin.y, Screen_Width * 0.267, Screen_Height * 0.0599)];
    [_sendcodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_sendcodeBtn.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [_sendcodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sendcodeBtn addTarget:self action:@selector(sendcode) forControlEvents:UIControlEventTouchUpInside];
    _sendcodeBtn.backgroundColor = MainBlueColor;
    _sendcodeBtn.layer.masksToBounds = YES;
    _sendcodeBtn.layer.cornerRadius = 4;
    [self.view addSubview:_sendcodeBtn];
    
    
    _passwordTextField = [[UITextField alloc]init];
    [_passwordTextField setFrame:CGRectMake(Screen_Width * 0.0665, _codeTextField.frame.size.height + _codeTextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _passwordTextField.textColor = [UIColor grayColor];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _passwordTextField.font = [UIFont systemFontOfSize:16];
    _passwordTextField.secureTextEntry = YES;//密码模式
    _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _passwordTextField.backgroundColor = [UIColor clearColor];
    _passwordTextField.placeholder = @"新密码～";
    _passwordTextField.delegate = self;
    UIView *View4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image4 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _stuidTextField.frame.size.height * 0.45 / 2, 12, _stuidTextField.frame.size.height * 0.55)];
    [image4 setImage:[UIImage imageNamed:@"login_nick_icon.png"]];
    [View4 addSubview:image4];
    _passwordTextField.leftView = View4;
    [self.view addSubview:_passwordTextField];
    
    
    _passwordTextFieldrevise = [[UITextField alloc]init];
    [_passwordTextFieldrevise setFrame:CGRectMake(Screen_Width * 0.0665, _passwordTextField.frame.size.height + _passwordTextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _passwordTextFieldrevise.textColor = [UIColor grayColor];
    _passwordTextFieldrevise.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _passwordTextFieldrevise.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _passwordTextFieldrevise.font = [UIFont systemFontOfSize:16];
    _passwordTextFieldrevise.secureTextEntry = YES;//密码模式
    _passwordTextFieldrevise.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _passwordTextFieldrevise.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _passwordTextFieldrevise.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _passwordTextFieldrevise.backgroundColor = [UIColor clearColor];
    _passwordTextFieldrevise.placeholder = @"再次输入新密码～";
    _passwordTextFieldrevise.delegate = self;
    UIView *View5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image5 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _passwordTextFieldrevise.frame.size.height * 0.45 / 2, 12, _passwordTextFieldrevise.frame.size.height * 0.55)];
    [image5 setImage:[UIImage imageNamed:@"login_nick_icon.png"]];
    [View5 addSubview:image5];
    _passwordTextFieldrevise.leftView = View5;
    [self.view addSubview:_passwordTextFieldrevise];
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setFrame:CGRectMake(Screen_Width * 0.0665, _passwordTextFieldrevise.frame.size.height + _passwordTextFieldrevise.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    [_sureBtn setTitle:@"确 认" forState:UIControlStateNormal];
    [_sureBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];//设置加粗
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sureBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    _sureBtn.backgroundColor = MainBlueColor;
    _sureBtn.layer.masksToBounds = YES;
    _sureBtn.layer.cornerRadius = 4;
    [self.view addSubview:_sureBtn];
    
    
    
    
    _passwordTextField.hidden = YES;
    _passwordTextFieldrevise.hidden = YES;
    _sureBtn.hidden = YES;
    
}
-(void)sendcode{
    
    NSString * student_number = _stuidTextField.text;
    NSString * student_email = _emailTextField.text;

    [[HttpManager instance] requestEmailCode:@{STUDENT_NUMBER:student_number, STUDENT_EMAIL:student_email} success:^(id responseObject) {
        NSDictionary * responseDic = responseObject;
        NSString * result = responseDic[@"result"];
        if([result isEqualToString:@"successed"]){
            
            _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"亲，已经给你的邮箱发送了验证邮件" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            [_baseAlert show];
            
            _sendcodeBtn.userInteractionEnabled = NO;
            [_sendcodeBtn setTitle:@"已发送" forState:UIControlStateNormal];
            
            _passwordTextField.hidden = NO;
            _passwordTextFieldrevise.hidden = NO;
            _sureBtn.hidden = NO;
        }
        else{
            _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:responseObject[@"reason"] delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            [_baseAlert show];
        }
        NSLog(@"%@",responseDic);
    } failure:^(NSError *error) {
        _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络出错" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
        [_baseAlert show];
        NSLog(@"%@",error);
    }];
    
}
-(void)sure{
    if(_stuidTextField.text.length == 0){
        
    }
    else if(_codeTextField.text.length == 0){
        
    }
    else if(_passwordTextField.text.length == 0){
        
    }
    else if(_passwordTextFieldrevise.text.length == 0){
        
    }
    else{
        
        NSString * stuid = _stuidTextField.text;
        NSString * code  = _codeTextField.text;
        NSString * password = _passwordTextField.text;
        NSString * passwordrevise = _passwordTextFieldrevise.text;
        
        [[HttpManager instance] requestForgetPassword:@{STUDENT_NUMBER:stuid,NEW_PASSWORD:password,AGAIN_PASSWORD:passwordrevise,EMAILCODE:code} success:^(id responseObject) {
            NSDictionary * responseDic = responseObject;
            NSString * result = responseDic[@"result"];
            if([result isEqualToString:@"successed"]){
                
                _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"亲，修改密码成功!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                
                [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
                [_baseAlert show];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
            NSLog(@"%@",responseDic);
        } failure:^(NSError *error) {
            _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网路出错!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            [_baseAlert show];
            NSLog(@"%@",error);
        }];
    }
}
-(void) performDismiss:(NSTimer *)timer
{
    [_baseAlert dismissWithClickedButtonIndex:0 animated:NO];
}//收起输入框
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![_stuidTextField isExclusiveTouch]) {
        [_stuidTextField resignFirstResponder];
    }
    if (![_passwordTextField isExclusiveTouch]) {
        [_passwordTextField resignFirstResponder];
    }
    if (![_passwordTextFieldrevise isExclusiveTouch]) {
        [_passwordTextFieldrevise resignFirstResponder];
    }
    if (![_codeTextField isExclusiveTouch]){
        [_codeTextField resignFirstResponder];
    }
    if (![_emailTextField isExclusiveTouch]){
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

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}
@end
