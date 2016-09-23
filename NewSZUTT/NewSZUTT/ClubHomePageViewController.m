//
//  ClubHomePageViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/7.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "ClubHomePageViewController.h"
#import "ClubHomeHeaderView.h"

@interface ClubHomePageViewController()<UITableViewDelegate,UITableViewDataSource>{
    UITableView * _tableView;
}

@end

@implementation ClubHomePageViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    //headerView : 一张集体合照 左下角社团logo
    //section 1 : 社团文字简介
    //section 2 : 社团活动列举
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, Screen_Width, Screen_Height) style:UITableViewStyleGrouped];
    _tableView.backgroundView = nil;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.backgroundColor = MainWhiteColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = YES;
    [self.view addSubview:_tableView];
    
    ClubHomeHeaderView * headerView = [[ClubHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 150)];
    [_tableView setTableHeaderView:headerView];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        NSString * identifier = @"LevelClubCell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.textLabel.text = @"这里";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.textColor = [UIColor grayColor];
            [cell.textLabel setFont:[UIFont systemFontOfSize:13]];
            cell.imageView.image = [UIImage imageNamed:@"clubevent_icon"];
            _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            
        }
        else{
            
        }
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
@end
