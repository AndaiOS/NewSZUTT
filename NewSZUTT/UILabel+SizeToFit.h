//
//  UILabel+SizeToFit.h
//  NewSZUTT
//
//  Created by 安达 on 16/4/14.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SizeToFit)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

@end
