//
//  UIImage+ImageWithColor.m
//  NewSZUTT
//
//  Created by 安达 on 16/3/31.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "UIImage+ImageWithColor.h"

@implementation UIImage (WithColor)

+(UIImage *)imageWithColor:(UIColor *)color{
    return [self imageWithColor:color size:CGSizeMake(1,1)];
}
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);//创建一个位图
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+ (UIImage *)resizableImageWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius{
    return nil;
}
@end
