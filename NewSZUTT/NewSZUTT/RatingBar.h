//
//  RatingBar.h
//  NewSZUTT
//
//  Created by 安达 on 16/4/6.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RatingBar;

@protocol RatingBarDelegate <NSObject>

//评分改变  评分控件、评分值
-(void)ratingBar:(RatingBar *)ratingBar ratingChanged:(float)newRating;


@end

@interface RatingBar : UIView

-(void)setImageDeselected:(NSString *)deselectedName halfSelected:(NSString *)halfSelectedName fullSelected:(NSString *)fullSelectedName andDelegate:(id<RatingBarDelegate>)delegate;

/**
 *  设置评分值
 *
 *  @param rating 评分值
 */
- (void)displayRating:(float)rating;

/**
 *  获取当前的评分值
 *
 *  @return 评分值
 */
- (float)rating;

/**
 *  是否是指示器，如果是指示器，就不能滑动了，只显示结果，不是指示器的话就能滑动修改值
 *  默认为NO
 */

-(void)setRating:(float)rating;

@property (nonatomic,assign) BOOL isIndicator;




@end
