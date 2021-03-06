//
//  ZLDropDownMenuCollectionViewCell.m
//  ZLDropDownMenuDemo
//
//  Created by zhaoliang on 16/1/27.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "ZLDropDownMenuCollectionViewCell.h"
#import "Masonry.h"
#import "ZLDropDownMenuUICalc.h"

@interface ZLDropDownMenuCollectionViewCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ZLDropDownMenuCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self viewConfig];
    }
    return self;
}


- (void)viewConfig
{
    __weak typeof(self) weakSelf = self;
    _label = [[UILabel alloc] init];
    _label.layer.cornerRadius = dropDownMenuCollectionViewUIValue()->CELL_LABEL_CORNERRADIUS;
    _label.layer.masksToBounds = YES;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:dropDownMenuCollectionViewUIValue()->CELL_LABEL_FONT];
    [self addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
}

- (void)setContentString:(NSString *)contentString
{
    _contentString = [contentString copy];
    _label.text = _contentString;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    _label.backgroundColor = selected ? [UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:1] : [UIColor clearColor];
    _label.textColor = selected ? [UIColor whiteColor] : [UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:1];
}


@end
