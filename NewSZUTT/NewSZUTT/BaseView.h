//
//  BaseView.h
//  NewSZUTT
//
//  Created by 安达 on 16/9/25.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseView ; 
@protocol ChangeStyle <NSObject>;
- (void)changeStyle:(NSInteger)type;
@end

@interface BaseView : UIView

@property (nonatomic , assign) NSInteger type;

@property (nonatomic , assign) id<ChangeStyle> delegate;

@end
