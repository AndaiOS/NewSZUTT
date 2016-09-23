//
//  MyAlertView.h
//  NewSZUTT
//
//  Created by 安达 on 16/5/20.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAlertView : UIAlertView

+(MyAlertView *)instance;

-(void)setTitle:(NSString *)title setMessage:(NSString *)message setDelegate:(id)sender setCancelButtonTitle:(NSString*)title setOtherButtonTitles:(NSArray *)array;

-(void)setTimeInterval:(CGFloat)interval setTarget:(id)sender;


@end
