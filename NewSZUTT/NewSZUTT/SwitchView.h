//
//  SwitchView.h
//  NewSZUTT
//
//  Created by 安达 on 16/4/4.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchView : UIView
@property (strong,nonatomic) UIButton * button1;
@property (strong,nonatomic) UIButton * button2;
@property (strong,nonatomic) UIImageView * img1;
@property (strong,nonatomic) UIImageView * img2;

@property (strong,nonatomic) void (^ButtonActionBlock)(int buttonTag);

-(void)swipeAction:(int)tag;
@end
