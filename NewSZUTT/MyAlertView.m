//
//  MyAlertView.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/20.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "MyAlertView.h"

@interface MyAlertView(){
    UIAlertView * _baseAlert;
    NSTimer * _timer;
}

@end

@implementation MyAlertView

+(MyAlertView *)instance{
    
    static dispatch_once_t pred;
    static MyAlertView * _sharedMyAlertView = nil;
    dispatch_once(&pred , ^{ _sharedMyAlertView = [[self alloc]init];});//实例化单例
    return _sharedMyAlertView;
}
-(id)init{
    self = [super init];
    if(self){
        _baseAlert = [[UIAlertView alloc]init];
    }
    return self;
}
-(void)setTitle:(NSString *)maintitle setMessage:(NSString *)message setDelegate:(id)sender setCancelButtonTitle:(NSString *)buttontitle setOtherButtonTitles:(NSArray *)array{
    _baseAlert = [[UIAlertView alloc] initWithTitle:maintitle message:message delegate:self cancelButtonTitle:buttontitle otherButtonTitles:nil, nil];
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:sender selector:@selector(performDismiss:) userInfo:nil repeats:NO];
    [_baseAlert show];
}
-(void)setTimeInterval:(CGFloat)interval setTarget:(id)sender{
    
}
-(void) performDismiss:(NSTimer *)timer
{
    [_baseAlert dismissWithClickedButtonIndex:0 animated:YES];
}
@end
