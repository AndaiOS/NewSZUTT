//
//  CommandingCollectionViewCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/15.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "CommandingCollectionViewCell.h"

@interface CommandingCollectionViewCell(){
    UIImageView * _lessonIcon;
    UILabel * _lessonName;
}
@end

@implementation CommandingCollectionViewCell

-(void)setLessonCell{
    self.backgroundColor = MainWhiteColor;
    if(!_lessonIcon){
        _lessonIcon = [[UIImageView alloc]init];
        //_lessonIcon.contentMode = UIViewContentModeScaleAspectFit;//填充整个cell
        [_lessonIcon setFrame:CGRectMake((85-55)/2, 5, 55, 55)];
        _lessonIcon.image = [UIImage imageNamed:@"lesson_icon1"];
        //_lessonIcon.layer.masksToBounds = YES;
        _lessonIcon.layer.cornerRadius = 8;
        [self addSubview:_lessonIcon];
    }
    if(!_lessonName){
        _lessonName = [[UILabel alloc]init];
        [_lessonName setFrame:CGRectMake((85-65)/2, _lessonIcon.frame.origin.y + _lessonIcon.frame.size.height + 5, 65, 15)];
        _lessonName.textColor = [UIColor grayColor];
        _lessonName.font = [UIFont systemFontOfSize:10];
        _lessonName.text = @"程序设计基础";
        [self addSubview:_lessonName];
    }
}



@end






















