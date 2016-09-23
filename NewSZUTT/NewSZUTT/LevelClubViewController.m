//
//  LevelClubViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/7.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "LevelClubViewController.h"
#import "EachClubEventTableViewCell.h"

@interface LevelClubViewController()<UITableViewDataSource,UITableViewDelegate>{
    UITableView * _tableView;
}

@end

@implementation LevelClubViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"校级社团活动";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, Screen_Width, Screen_Height) style:UITableViewStyleGrouped];
    _tableView.backgroundView = nil;
    _tableView.backgroundColor = MainWhiteColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = YES;
    [self.view addSubview:_tableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //section 1 : 热门社团(logo)
    //section 2 : row1:校级
    //            row2:院级
    //section 3 : 社团活动(按行)
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        NSString * identifier = @"EachClubCell";
        EachClubEventTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil){
            cell = [[EachClubEventTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;//网络请求数量
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Screen_Height * 0.58;
}


@end
