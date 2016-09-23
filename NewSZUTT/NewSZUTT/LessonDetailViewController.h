//
//  LessonDetailViewController.h
//  NewSZUTT
//
//  Created by 安达 on 16/4/14.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonDetailViewController : UIViewController

@property (nonatomic , strong) NSString * lesson_id;

-(void)setLesson_id:(NSString *)lesson_id;

@property (nonatomic ,strong) NSString * isAudit;//是否为旁听

-(void)setIsAudit:(NSString *)isAudit;


@end
