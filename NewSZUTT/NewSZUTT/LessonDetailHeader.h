//
//  LessonDetailHeader.h
//  NewSZUTT
//
//  Created by 安达 on 16/4/18.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonDetailHeader : UIView

@property (nonatomic,strong) UIButton * commandBtn;

-(void)setInfo:(NSDictionary *)info;

@end
