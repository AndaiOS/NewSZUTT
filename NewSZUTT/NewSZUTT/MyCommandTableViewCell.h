//
//  MyCommandTableViewCell.h
//  NewSZUTT
//
//  Created by 安达 on 16/4/9.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCommandTableViewCell : UITableViewCell

-(void)setInfo:(NSMutableDictionary *)info;
-(void)setLessonName:(NSString *)lessonname;
-(void)setDiscoverInfo:(NSDictionary *)info;

@property (nonatomic , strong) UIButton * deleteButton;
@property (nonatomic , strong) NSString * comment_id;


@end
