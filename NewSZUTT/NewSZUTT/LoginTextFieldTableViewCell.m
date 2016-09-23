//
//  LoginTextFieldTableViewCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/3/30.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "LoginTextFieldTableViewCell.h"

@implementation LoginTextFieldTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;//看不出被选中状态
        _icon = [[UIImageView alloc]init];
        [self addSubview:_icon];//不是在self.view上，只是一个cell
        
        _textField = [[MyTextField alloc]init];
        _textField.textColor = [UIColor grayColor];
        _textField.borderStyle = UITextBorderStyleNone;//设置边框样式，枚举类型
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直对齐方式
        _textField.font = [UIFont systemFontOfSize:16];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中的❌符号，在编辑时出现
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
        _textField.delegate =self;
        _textField.backgroundColor = [UIColor clearColor];
        _textField.placeholderColor = [UIColor colorWithRed:176.0/255 green:176.0/255 blue:176.0/255 alpha:1];
        [self addSubview:_textField];
    }
    return self;
}
-(void)setIconImage:(UIImage *)image{
    _icon.image = image;
}
-(void)setLineViewHidden:(BOOL)isLineViewHidden{
    _isLineViewHidden = isLineViewHidden;
    
}


- (void)awakeFromNib {
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
