//
//  HomeWorkViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/19.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "HomeWorkViewController.h"
#import "HomeWorkTableViewCell.h"
@interface HomeWorkViewController()<UITableViewDataSource,UITableViewDelegate>{
    UITableView * _tableView;
    NSMutableArray * _openedSectionArray;
    NSMutableArray * _sectionArray;
    NSMutableArray * _rowofsectionArray;
}

@end

@implementation HomeWorkViewController

-(void)viewDidLoad{
    self.view.backgroundColor = MainWhiteColor;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 74, Screen_Width, Screen_Height-74) style:UITableViewStyleGrouped];
    _tableView.backgroundView = nil;
    _tableView.backgroundColor = MainWhiteColor;
    _tableView.separatorColor = [UIColor grayColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = YES;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    _sectionArray = [[NSMutableArray alloc]initWithObjects:@"今天(0)",@"明天(1)",@"此周(2)",@"将来(5)", nil];
    _rowofsectionArray = [[NSMutableArray alloc]initWithObjects:@"2",@"3",@"4",@"2", nil];
    _openedSectionArray = [[NSMutableArray alloc]initWithObjects:@"0",@"0",@"0",@"0", nil];
}
-(void)tapHeader:(UIButton *)sender{
    if([[_openedSectionArray objectAtIndex:sender.tag - 100]intValue] == 0){
        [_openedSectionArray replaceObjectAtIndex:sender.tag - 100 withObject:@"1"];
    }
    else{
         [_openedSectionArray replaceObjectAtIndex:sender.tag - 100 withObject:@"0"];
    }
    [_tableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_sectionArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 34;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * sectionheaderView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.1, 0, Screen_Width * 0.98 , 34)];
    sectionheaderView.backgroundColor = [UIColor whiteColor];
    sectionheaderView.layer.cornerRadius = 2;
    sectionheaderView.layer.backgroundColor = [UIColor whiteColor].CGColor;
    sectionheaderView.layer.shadowOffset = CGSizeMake(0.5,1);
    sectionheaderView.layer.shadowRadius = 1;
    sectionheaderView.layer.shadowOpacity = 0.3;
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, Screen_Width * 0.8, 34);
    button.tag = 100 + section;
    [button addTarget:self action:@selector(tapHeader:) forControlEvents:UIControlEventTouchUpInside];
    [sectionheaderView addSubview:button];
    
    UIImageView * Icon = [[UIImageView alloc]initWithFrame:CGRectMake(10, (34-25)/2, 25, 25)];
    Icon.image = [UIImage imageNamed:@"college_icon"];
    Icon.layer.cornerRadius = 4;
    Icon.layer.masksToBounds = YES;
    [sectionheaderView addSubview:Icon];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(40, (34-30)/2, 150, 30)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:13];
    label.text = [_sectionArray objectAtIndex:section];
    [button addSubview:label];
    
    return sectionheaderView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([[_openedSectionArray objectAtIndex:section]intValue] == 1){
        return [[_rowofsectionArray objectAtIndex:section]intValue];
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"homeworkCell";
    HomeWorkTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[HomeWorkTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

@end












