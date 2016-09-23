//
//  UserMarkViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/6/5.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "UserMarkViewController.h"

@interface UserMarkViewController()<UITextFieldDelegate>{
    UIImageView * _image;
    UITextField * _stuidTextField;
    UITextField * _passwordTextField;
    UITextField * _codeTextField;
    UIImageView * _codeImage; //验证码图片
    
    UIButton * _sureBtn;
    UIAlertView * _baseAlert;
    UIImage * _codeimage;
}

@end

@implementation UserMarkViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = MainBlueColor;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 84, Screen_Width, Screen_Width * 0.2789)];
    _image.image = [UIImage imageNamed:@"szu_logo"];
    [self.view addSubview:_image];
    
    _stuidTextField = [[UITextField alloc]init];
    [_stuidTextField setFrame:CGRectMake(Screen_Width * 0.0665, Screen_Height * 0.35, Screen_Width * 0.867, Screen_Height * 0.0599)];
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
    
    
    _passwordTextField = [[UITextField alloc]init];
    [_passwordTextField setFrame:CGRectMake(Screen_Width * 0.0665, _stuidTextField.frame.size.height + _stuidTextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _passwordTextField.textColor = [UIColor grayColor];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _passwordTextField.font = [UIFont systemFontOfSize:16];
    _passwordTextField.secureTextEntry = YES;//密码模式
    _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _passwordTextField.backgroundColor = [UIColor clearColor];
    _passwordTextField.placeholder = @"亲,选课密码!!";
    _passwordTextField.delegate = self;
    UIView *View2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image2 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _stuidTextField.frame.size.height * 0.45 / 2, 12, _stuidTextField.frame.size.height * 0.55)];
    [image2 setImage:[UIImage imageNamed:@"login_password_icon.png"]];
    [View2 addSubview:image2];
    _passwordTextField.leftView = View2;
    [self.view addSubview:_passwordTextField];
    
    _codeTextField = [[UITextField alloc]init];
    [_codeTextField setFrame:CGRectMake(Screen_Width * 0.0665, _passwordTextField.frame.size.height + _passwordTextField.frame.origin.y + 15, Screen_Width * 0.567, Screen_Height * 0.0599)];
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
    
    _codeImage = [[UIImageView alloc]initWithFrame:CGRectMake(_stuidTextField.frame.size.width + _stuidTextField.frame.origin.x - Screen_Width * 0.267, _codeTextField.frame.origin.y, Screen_Width * 0.267, Screen_Height * 0.0599)];
    _codeImage.image = _codeimage;
    [self.view addSubview:_codeImage];
    
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setFrame:CGRectMake(Screen_Width * 0.0665, _codeTextField.frame.size.height + _codeTextField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    [_sureBtn setTitle:@"查 询" forState:UIControlStateNormal];
    [_sureBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];//设置加粗
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sureBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    _sureBtn.backgroundColor = MainBlueColor;
    _sureBtn.layer.masksToBounds = YES;
    _sureBtn.layer.cornerRadius = 4;
    [self.view addSubview:_sureBtn];
    
}
-(void)viewWillAppear:(BOOL)animated{
    //二进制流转图片
    NSString *URL = @"http://120.25.201.239:8080/SZUTTinterface/sendcode_secondrs_Credits_statistics.spring";
    NSData *imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:URL]];
    UIImage *image=[[UIImage alloc] initWithData:imageData];
    [_codeImage setImage:image];
}

-(void)sure{
    NSString * student_number = _stuidTextField.text;
    NSString * student_password = _passwordTextField.text;
    NSString * code = _codeTextField.text;
    [[HttpManager instance] requestProfileCredits:@{@"userid":student_number, @"password":student_password,@"getcode":code} success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        if([responseObject[@"result"]isEqualToString:@"successed"]){
            
            //存入UserDefaults
            [[NSUserDefaults standardUserDefaults]setValue:responseObject[@"had_elective_mark"]forKey:@"had_elective_mark"];
            [[NSUserDefaults standardUserDefaults]setValue:responseObject[@"had_required_mark"]forKey:@"had_required_mark"];
            [[NSUserDefaults standardUserDefaults]setValue:responseObject[@"need_elective_mark"]forKey:@"need_elective_mark"];
            [[NSUserDefaults standardUserDefaults]setValue:responseObject[@"need_required_mark"]forKey:@"need_required_mark"];
            [[NSUserDefaults standardUserDefaults]setValue:responseObject[@"0"]forKey:@"already"];
            
            
            _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"查询成功" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            [_baseAlert show];
            
            [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:responseObject[@"reason"] delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            [_baseAlert show];
        }
        
    } failure:^(NSError *error) {
        _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"查询失败" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
        [_baseAlert show];
        NSLog(@"%@",error);
    }];
}
-(void) performDismiss:(NSTimer *)timer
{
    [_baseAlert dismissWithClickedButtonIndex:0 animated:YES];
}
//收起输入框
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![_stuidTextField isExclusiveTouch]) {
        [_stuidTextField resignFirstResponder];
    }
    if (![_passwordTextField isExclusiveTouch]) {
        [_passwordTextField resignFirstResponder];
    }
    if (![_codeTextField isExclusiveTouch]){
        [_codeTextField resignFirstResponder];
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
