//
//  RatingBar.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/6.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "RatingBar.h"

@interface RatingBar(){
    float starRating;
    float lastRating;
    float height;//星星图片高度
    float width;//星星图片宽度
    UIImage * _unSelectedImage;
    UIImage * _halfSelectedImage;
    UIImage * _fullSelectedImage;
}
@property (nonatomic , strong) UIImageView * star1;
@property (nonatomic , strong) UIImageView * star2;
@property (nonatomic , strong) UIImageView * star3;
@property (nonatomic , strong) UIImageView * star4;
@property (nonatomic , strong) UIImageView * star5;

@property (nonatomic , weak) id<RatingBarDelegate> delegate;

@end

@implementation RatingBar

-(void)setImageDeselected:(NSString *)deselectedName halfSelected:(NSString *)halfSelectedName fullSelected:(NSString *)fullSelectedName andDelegate:(id<RatingBarDelegate>)delegate{
    
    self.delegate = delegate;
    _unSelectedImage = [UIImage imageNamed:deselectedName];
    _halfSelectedImage = halfSelectedName == nil ? _unSelectedImage : [UIImage imageNamed:halfSelectedName];
    _fullSelectedImage = [UIImage imageNamed:fullSelectedName];
    height = 0.0;
    width = 0.0;
    if (height < [_fullSelectedImage size].height) {
        height = [_fullSelectedImage size].height;
    }
    if (height < [_halfSelectedImage size].height) {
        height = [_halfSelectedImage size].height;
    }
    if (height < [_unSelectedImage size].height) {
        height = [_unSelectedImage size].height;
    }
    if (width < [_fullSelectedImage size].width) {
        width = [_fullSelectedImage size].width;
    }
    if (width < [_halfSelectedImage size].width) {
        width = [_halfSelectedImage size].width;
    }
    if (width < [_unSelectedImage size].width) {
        width = [_unSelectedImage size].width;
    }
    height = 15;
    width = 15;
    
    //控件宽度适配
    CGRect frame = [self frame];
    CGFloat viewWidth = width * 5;
    if(frame.size.width > viewWidth){
        viewWidth = frame.size.width;
    }
    frame.size.width = viewWidth;
    frame.size.height = height;
    [self setFrame:frame];
    
    starRating = 0.0;
    lastRating = 0.0;
    
    _star1 = [[UIImageView alloc]initWithImage:_unSelectedImage];
    _star2 = [[UIImageView alloc]initWithImage:_unSelectedImage];
    _star3 = [[UIImageView alloc]initWithImage:_unSelectedImage];
    _star4 = [[UIImageView alloc]initWithImage:_unSelectedImage];
    _star5 = [[UIImageView alloc]initWithImage:_unSelectedImage];
    
    CGFloat space = 5;
    CGFloat startX = space;
    [_star1 setFrame:CGRectMake(startX, 0, width, height)];
    startX += width + space;
    [_star2 setFrame:CGRectMake(startX, 0, width, height)];
    startX += width + space;
    [_star3 setFrame:CGRectMake(startX, 0, width, height)];
    startX += width + space;
    [_star4 setFrame:CGRectMake(startX, 0, width, height)];
    startX += width + space;
    [_star5 setFrame:CGRectMake(startX, 0, width, height)];
    
    [_star1 setUserInteractionEnabled:NO];
    [_star2 setUserInteractionEnabled:NO];
    [_star3 setUserInteractionEnabled:NO];
    [_star4 setUserInteractionEnabled:NO];
    [_star5 setUserInteractionEnabled:NO];
    
    [self addSubview:_star1];
    [self addSubview:_star2];
    [self addSubview:_star3];
    [self addSubview:_star4];
    [self addSubview:_star5];
}
-(void)displayRating:(float)rating{
    [_star1 setImage:_unSelectedImage];
    [_star2 setImage:_unSelectedImage];
    [_star3 setImage:_unSelectedImage];
    [_star4 setImage:_unSelectedImage];
    [_star5 setImage:_unSelectedImage];
    
    if (rating >= 0.5) {
        [_star1 setImage:_halfSelectedImage];
    }
    if (rating >= 1) {
        [_star1 setImage:_fullSelectedImage];
    }
    if (rating >= 1.5) {
        [_star2 setImage:_halfSelectedImage];
    }
    if (rating >= 2) {
        [_star2 setImage:_fullSelectedImage];
    }
    if (rating >= 2.5) {
        [_star3 setImage:_halfSelectedImage];
    }
    if (rating >= 3) {
        [_star3 setImage:_fullSelectedImage];
    }
    if (rating >= 3.5) {
        [_star4 setImage:_halfSelectedImage];
    }
    if (rating >= 4) {
        [_star4 setImage:_fullSelectedImage];
    }
    if (rating >= 4.5) {
        [_star5 setImage:_halfSelectedImage];
    }
    if (rating >= 5) {
        [_star5 setImage:_fullSelectedImage];
    }
    
    starRating = rating;
    lastRating = rating;
    [_delegate ratingBar:self ratingChanged:rating];//代理方法
}
//获取当前评分的值
-(float)rating{
    return starRating;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesRating:touches];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesRating:touches];
}
-(void)touchesRating:(NSSet *)touches{
    if(self.isIndicator){
        return ;
    }
    CGPoint point = [[touches anyObject] locationInView:self];
    //星星图片的间距
    CGFloat space = 5;
    
    float newRating = 0;
    
    if(point.x >= 0 && point.x <= self.frame.size.width){
        if(point.x <= space + width * 0.5f){ //在第一个图片的一半以前都算0.5
            newRating = 0.5;
        }
        else if(point.x < space * 2 + width){ // 在第二个图片以前都算1
            newRating = 1.0;
        }
        else if(point.x <= space * 2 + width * 1.5f){
            newRating = 1.5;
        }
        else if(point.x < space * 3 + width * 2){
            newRating = 2.0;
        }
        else if(point.x <= space * 3 + width * 2.5f){
            newRating = 2.5;
        }
        else if(point.x < space * 4 + width * 3){
            newRating = 3.0;
        }
        else if(point.x <= space * 4 + width * 3.5f){
            newRating = 3.5;
        }
        else if (point.x <= 5*space+4*width){
            newRating = 4.0;
        }
        else if (point.x <=5*space+4.5*width){
            newRating = 4.5;
        }
        else {
            newRating = 5.0;
        }
    }
    if (newRating != lastRating){
        [self displayRating:newRating];
    }
}
-(void)setRating:(float)rating{
    [_star1 setImage:_unSelectedImage];
    [_star2 setImage:_unSelectedImage];
    [_star3 setImage:_unSelectedImage];
    [_star4 setImage:_unSelectedImage];
    [_star5 setImage:_unSelectedImage];
    
    if (rating >= 0.5) {
        [_star1 setImage:_halfSelectedImage];
    }
    if (rating >= 1) {
        [_star1 setImage:_fullSelectedImage];
    }
    if (rating >= 1.5) {
        [_star2 setImage:_halfSelectedImage];
    }
    if (rating >= 2) {
        [_star2 setImage:_fullSelectedImage];
    }
    if (rating >= 2.5) {
        [_star3 setImage:_halfSelectedImage];
    }
    if (rating >= 3) {
        [_star3 setImage:_fullSelectedImage];
    }
    if (rating >= 3.5) {
        [_star4 setImage:_halfSelectedImage];
    }
    if (rating >= 4) {
        [_star4 setImage:_fullSelectedImage];
    }
    if (rating >= 4.5) {
        [_star5 setImage:_halfSelectedImage];
    }
    if (rating >= 5) {
        [_star5 setImage:_fullSelectedImage];
    }
}


@end


















