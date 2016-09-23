//
//  TeacherTableViewCell.h
//  NewSZUTT
//
//  Created by 安达 on 16/4/8.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeacherTableViewCell : UITableViewCell

-(void)setName:(NSString *)name Phone:(NSString *)phone Address:(NSString *)address Email:(NSString *)email;

-(void)setInfo:(NSDictionary *)info;

@end
