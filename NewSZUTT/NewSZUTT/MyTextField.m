//
//  MyTextField.m
//  NewSZUTT
//
//  Created by 安达 on 16/3/31.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "MyTextField.h"

@implementation MyTextField
-(void)drawPlaceholderInRect:(CGRect)rect{
    NSDictionary * attributes = @{NSForegroundColorAttributeName:_placeholderColor,NSFontAttributeName:self.font};
    CGRect boundingRect = [self.placeholder boundingRectWithSize:rect.size options:0 attributes:attributes context:nil];
    [self.placeholder drawAtPoint:CGPointMake(0, (rect.size.height/2)-boundingRect.size.height/2) withAttributes:attributes];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
