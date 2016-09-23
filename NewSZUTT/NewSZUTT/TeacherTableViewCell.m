//
//  TeacherTableViewCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/8.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "TeacherTableViewCell.h"

@interface TeacherTableViewCell(){
    UIImageView * _personImg;
    UILabel     * _teacherName;
    UIImageView * _phoneImg;
    UILabel     * _teacherPhone;
    UIImageView * _addressImg;
    UILabel     * _teacherAddress;
    UIImageView * _emailImg;
    UILabel     * _teacherEmail;
}

@end

@implementation TeacherTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _personImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_person_red"]];
        [_personImg setFrame:CGRectMake(10, 10, 15, 15)];
        _teacherName = [[UILabel alloc]initWithFrame:CGRectMake(_personImg.frame.origin.x + 20 + 20, 10, 160, 15)];
        _teacherName.text = @"空";
        [_teacherName setFont:[UIFont systemFontOfSize:15]];
        _teacherName.textColor = [UIColor grayColor];
        
        _phoneImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_phone_green"]];
        [_phoneImg setFrame:CGRectMake(10, 25 + 5, 15, 15)];
        _teacherPhone = [[UILabel alloc]initWithFrame:CGRectMake(_phoneImg.frame.origin.x + 20 + 20, 25 + 5, 160, 15)];
        _teacherPhone.text = @"空";
        [_teacherPhone setFont:[UIFont systemFontOfSize:15]];
        _teacherPhone.textColor = [UIColor grayColor];
        
        _addressImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_address"]];
        [_addressImg setFrame:CGRectMake(10, 45 + 5, 15, 15)];
        _teacherAddress = [[UILabel alloc]initWithFrame:CGRectMake(_addressImg.frame.origin.x + 20 + 20, 45 + 5, 160, 15)];
        _teacherAddress.text = @"空";
        [_teacherAddress setFont:[UIFont systemFontOfSize:15]];
        _teacherAddress.textColor = [UIColor grayColor];
        
        _emailImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_email_purple"]];
        [_emailImg setFrame:CGRectMake(10, 65 + 5, 15, 15)];
        _teacherEmail = [[UILabel alloc]initWithFrame:CGRectMake(_emailImg.frame.origin.x + 20 + 20, 65 + 5, 160, 15)];
        _teacherEmail.text = @"暂无";
        [_teacherEmail setFont:[UIFont systemFontOfSize:15]];
        _teacherEmail.textColor = [UIColor grayColor];
        
        [self.contentView addSubview:_personImg];
        [self.contentView addSubview:_teacherName];
        [self.contentView addSubview:_phoneImg];
        [self.contentView addSubview:_teacherPhone];
        [self.contentView addSubview:_addressImg];
        [self.contentView addSubview:_teacherAddress];
        [self.contentView addSubview:_emailImg];
        [self.contentView addSubview:_teacherEmail];
    }
    return self;
}
-(void)setName:(NSString *)name Phone:(NSString *)phone Address:(NSString *)address Email:(NSString *)email{
    _teacherName.text = name;
    _teacherPhone.text = phone;
    _teacherEmail.text = email;
    _teacherAddress.text = address;
}
-(void)setInfo:(NSDictionary *)info{
    _teacherName.text = [info valueForKey:@"teacher_name"];
    //拼接座机和短号
//    NSString * phone = [info valueForKey:@"teacher_phone"];
//    NSString * shortphone = [info valueForKey:@"teacher_shortphone"];
//    if(shortphone.length > 0){
//        phone = [NSString stringWithFormat:@"%@/%@",phone,shortphone];
//    }
//    _teacherPhone.text = phone;
    _teacherPhone.text = [info valueForKey:@"teacher_phone"];
    _teacherAddress.text = [info valueForKey:@"teacher_address"];
    _teacherEmail.text = [info valueForKey:@"teacher_email"];
    
    
}


@end
