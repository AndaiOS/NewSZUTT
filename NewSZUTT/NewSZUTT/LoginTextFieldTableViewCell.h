//
//  LoginTextFieldTableViewCell.h
//  NewSZUTT
//
//  Created by 安达 on 16/3/30.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTextField.h"
@interface LoginTextFieldTableViewCell : UITableViewCell<UITextFieldDelegate>
@property (nonatomic,strong) MyTextField * textField;
@property (nonatomic,assign) NSUInteger maximunLength;//给cell赋予本属性
@property (nonatomic,readonly) UIImageView * icon;
@property (nonatomic,assign,setter=setLineViewHidden:)BOOL isLineViewHidden;

-(void)setIconImage:(UIImage *)image;
@end
