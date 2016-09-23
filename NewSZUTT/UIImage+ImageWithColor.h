//
//  UIImage+ImageWithColor.h
//  NewSZUTT
//
//  Created by 安达 on 16/3/31.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WithColor)

+(UIImage *)imageWithColor:(UIColor *)color;
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)resizableImageWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;


@end
