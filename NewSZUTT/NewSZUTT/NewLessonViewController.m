//
//  NewLessonViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/9.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "NewLessonViewController.h"

@interface NewLessonViewController()<UITableViewDataSource , UITableViewDelegate>{
    UITableView * _tableView;
    UIButton * _button[36];     //36个课程格子
    
    int firstBtnWidth;     //课程大节格子宽度
    int lessonBtnWidth;    //课程格子宽度
    int BtnHeight;         //格子高度
}

@end

@implementation NewLessonViewController

-(void)viewDidLoad{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStyleGrouped];
    _tableView.backgroundView = nil;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorColor = [UIColor grayColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = YES;
    [self.view addSubview:_tableView];
    
    firstBtnWidth = 44;
    lessonBtnWidth = (Screen_Width - firstBtnWidth)/5;
    BtnHeight = 88;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"lessontimetableCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    int i = indexPath.row % 6 ;
    NSLog(@"%d",i);
    if(i < 6){//第几大节   对应的tag  [1,6]
        _button[i] = [[UIButton alloc]initWithFrame:CGRectMake(0, i * BtnHeight, firstBtnWidth, BtnHeight)];
        _button[i].backgroundColor = MainBlueColor;
        _button[i].tag = i * 6; //[0 , 6, 12, 18, 24, 30]
        [cell addSubview:_button[i]];
    }
    for(i = 6 * (indexPath.row%6) + 1;i < 6 * (indexPath.row + 1);i++){
        _button[i] = [[UIButton alloc]initWithFrame:CGRectMake(44 + (i-1) * lessonBtnWidth, 0 * BtnHeight, lessonBtnWidth, BtnHeight)];
        _button[i].backgroundColor = MainRedColor;
        if(i < 31)
            _button[i].tag = ((i % 6)-1) * 6 + ( indexPath.row + 1) % 6; //完美的矩阵转置算法
        else
            _button[i].tag = 6 * (i%6); //完美
        [cell addSubview:_button[i]];
    }
    

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}



@end
