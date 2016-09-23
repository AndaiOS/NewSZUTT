//
//  LessonTableHeader.h
//  NewSZUTT
//
//  Created by 安达 on 16/4/6.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonTableHeader : UIView

@property (nonatomic , strong) UIButton * weekBtn;
@property (nonatomic , strong) UIButton * monBtn;
@property (nonatomic , strong) UIButton * tueBtn;
@property (nonatomic , strong) UIButton * wedBtn;
@property (nonatomic , strong) UIButton * thrBtn;
@property (nonatomic , strong) UIButton * friBtn;

-(void)setWeekNumber:(NSInteger)weeknumber;

@end
