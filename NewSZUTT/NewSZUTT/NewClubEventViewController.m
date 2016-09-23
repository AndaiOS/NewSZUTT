//
//  NewClubEventViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/6.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "NewClubEventViewController.h"
#import "HotClubTableViewCell.h"
#import "MyCommandTableViewCell.h"
#import "EachClubEventTableViewCell.h"
#import "ClubEventHeaderView.h"
#include "LevelClubViewController.h"
#import "ClubHomePageViewController.h"


@interface NewClubEventViewController()<UITableViewDataSource,UITableViewDelegate,ClubEventViewControllerHeadViewDelegate>{
    UITableView * _tableView;
    NSArray * _titleArray;
    
}

@end

@implementation NewClubEventViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, Screen_Width, Screen_Height) style:UITableViewStyleGrouped];
    _tableView.backgroundView = nil;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.backgroundColor = MainWhiteColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = YES;
    [self.view addSubview:_tableView];
    
    ClubEventHeaderView * _headerView = [[ClubEventHeaderView alloc]initWithFrame:CGRectMake(Screen_Width * 0.01, 64, Screen_Width * 0.98, 150)];
    _headerView.delegate = self;
    [_tableView setTableHeaderView:_headerView];
    
    _titleArray = @[@"校级",@"院级"];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //section 1 : 热门社团(logo)
    //section 2 : row1:校级
    //            row2:院级
    //section 3 : 社团活动(按行)
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        NSString * identifier = @"LevelClubCell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.textLabel.text = _titleArray[indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.textColor = [UIColor grayColor];
            [cell.textLabel setFont:[UIFont systemFontOfSize:13]];
            cell.imageView.image = [UIImage imageNamed:@"clubevent_icon"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        if(indexPath.row == 0){
            LevelClubViewController * clubVC = [[LevelClubViewController alloc]init];
            [self.navigationController pushViewController:clubVC animated:YES];
        }
        else{
            LevelClubViewController * clubVC = [[LevelClubViewController alloc]init];
            [self.navigationController pushViewController:clubVC animated:YES];
        }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(void)ClubHeaderViewButtonClick:(UIButton *)button {
    ClubHomePageViewController * _clubVC = [[ClubHomePageViewController alloc]init];
    [self.navigationController pushViewController:_clubVC animated:YES];
}
@end
