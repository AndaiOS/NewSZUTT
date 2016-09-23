//
//  ShareViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/6/11.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController(){
    UIImageView * _Image;
    UIImageView * _Image2;
}
@end

@implementation ShareViewController

-(void)viewDidLoad{
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.barTintColor = MainBlueColor;
    
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    _Image = [[UIImageView alloc]initWithFrame:CGRectMake(Screen_Width * 0.25, Screen_Height * 0.25, Screen_Width * 0.5, Screen_Width * 0.5)];
    _Image.image = [UIImage imageNamed:@"erweima"];
    [self.view addSubview:_Image];

    _Image2 = [[UIImageView alloc]initWithFrame:CGRectMake(Screen_Width * 0, _Image.frame.origin.y + _Image.frame.size.height + 20, Screen_Width * 1.0, Screen_Width * 0.54)];
    _Image2.image = [UIImage imageNamed:@"share"];
    [self.view addSubview:_Image2];
    
    
}

@end
