//
//  PasswordViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/9.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "PasswordViewController.h"
#import "ChangePassWordViewController.h"
#define Screen_Width   [[UIScreen mainScreen]bounds].size.width
#define Screen_Height  [[UIScreen mainScreen]bounds].size.height

@interface PasswordViewController(){
    UIButton * _checkBtn;
    UITextField * _textField;
    UIAlertView * _baseAlert;
}

@end

@implementation PasswordViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _textField = [[UITextField alloc]init];
    [_textField setFrame:CGRectMake(Screen_Width * 0.0665, Screen_Height * 0.4, Screen_Width * 0.867, Screen_Height * 0.0599)];
    _textField.textColor = [UIColor grayColor];
    _textField.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式，枚举类型
    _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
    _textField.font = [UIFont systemFontOfSize:16];
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
    _textField.leftViewMode = UITextFieldViewModeAlways;//左侧光标
    _textField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
    _textField.backgroundColor = [UIColor clearColor];
    _textField.placeholder = @"亲你的原密码";
    _textField.autocorrectionType = UITextAutocorrectionTypeYes;//是否自动提示错误
    UIImageView * image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_password_icon.png"]];
    _textField.leftView = image;
    _textField.secureTextEntry = YES;//是否以密码形式展现
    
    
    UIView *View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, Screen_Height * 0.0599)];
    UIImageView * image2 = [[UIImageView alloc]initWithFrame:CGRectMake(8, _textField.frame.size.height * 0.3 / 2, 12, _textField.frame.size.height * 0.7)];
    [image2 setImage:[UIImage imageNamed:@"login_password_icon.png"]];
    [View addSubview:image2];
    _textField.leftView = View;
    _textField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_textField];
    
    
    
    _checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_checkBtn setFrame:CGRectMake(Screen_Width * 0.0665, _textField.frame.size.height + _textField.frame.origin.y + 15, Screen_Width * 0.867, Screen_Height * 0.0599)];
    [_checkBtn setTitle:@"确认" forState:UIControlStateNormal];
    [_checkBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];//设置加粗
    [_checkBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_checkBtn addTarget:self action:@selector(clickCheckBtn:) forControlEvents:UIControlEventTouchUpInside];
    _checkBtn.backgroundColor = MainBlueColor;
    _checkBtn.layer.masksToBounds = YES;
    _checkBtn.layer.cornerRadius = (Screen_Width - 25 * 2)/90;
    [self.view addSubview:_checkBtn];
    
    
    
    
    
    
}
-(void)clickCheckBtn:(id)sender{
    NSString * old_password = [[NSUserDefaults standardUserDefaults]objectForKey:@"password"];
    //进行旧密码的比对
    NSString * password = _textField.text;
    if([old_password isEqualToString:password]){
        ChangePassWordViewController * changePWVC = [[ChangePassWordViewController alloc]init];
        [self.navigationController pushViewController:changePWVC animated:YES];
    }
    else{
        _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"亲,密码错误!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
        [NSTimer scheduledTimerWithTimeInterval:0.9f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
        [_baseAlert show];
        
        _textField.text = @"";
    }
}
-(void) performDismiss:(NSTimer *)timer
{
    [_baseAlert dismissWithClickedButtonIndex:0 animated:NO];
}

@end
