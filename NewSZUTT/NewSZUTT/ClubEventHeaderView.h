//
//  ClubEventHeaderView.h
//  NewSZUTT
//
//  Created by 安达 on 16/5/7.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClubEventViewControllerHeadViewDelegate <NSObject>
- (void)ClubHeaderViewButtonClick:(UIButton *)button;
@end

@interface ClubEventHeaderView : UIView

@property (assign, nonatomic) id <ClubEventViewControllerHeadViewDelegate>delegate;
@end
