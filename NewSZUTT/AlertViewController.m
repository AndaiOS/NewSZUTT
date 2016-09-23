//
//  AlertViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/9.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController (){
    NSString * _title;
    NSString * _message;
    UIAlertController * _alert;
    UIAlertAction * _defaultAction;
}

@end

@implementation AlertViewController

-(void)setTitle:(NSString *)title setMessage:(NSString *)message{
    _title = title;
    _message = message;
}
-(id)init{
    
    _alert = [UIAlertController alertControllerWithTitle:_title message:_message preferredStyle:UIAlertControllerStyleAlert];
    _defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action) {}];
    [_alert addAction:_defaultAction];
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
