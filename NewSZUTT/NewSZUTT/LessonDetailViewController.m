//
//  LessonDetailViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/14.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "LessonDetailViewController.h"
#import "LessonDetailHeader.h"
#import "MyCommandTableViewCell.h"
#import "DoCommandViewController.h"

@interface LessonDetailViewController()<UITableViewDelegate,UITableViewDataSource>{
    UITableView * _tableView;
    UIButton * _deleteAudit;            //取消旁听按钮
    CABasicAnimation * _animation;
    float _oldoffset;
    float _endoffset;
    int flag;
    
    
    NSDictionary * _responseDic;
    NSArray * _commmentArray;
    NSString * _lesson_id;
    
}

@end

@implementation LessonDetailViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"课程详情";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //头部悬停需要为Plain样式的tableview
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView setFrame:CGRectMake(0, 64, Screen_Width, Screen_Height-64)];
    _tableView.separatorColor = [UIColor grayColor];
    _tableView.backgroundColor = MainWhiteColor;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = YES;
    _tableView.bounces = YES;
    
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0,0,0,0);
    _tableView.hidden = NO;
    
    [self.view addSubview:_tableView];
    
    //动态旁听按钮
    _deleteAudit = [[UIButton alloc]initWithFrame:CGRectMake((Screen_Width - 85)/2, Screen_Height - 64, 85, 25)];
    _deleteAudit.backgroundColor = MainRedColor;
    [_deleteAudit setTitle:@"移除旁听" forState:UIControlStateNormal];
    _deleteAudit.titleLabel.font = [UIFont systemFontOfSize:13];
    _deleteAudit.layer.cornerRadius = 4;
    _deleteAudit.layer.shadowColor = [UIColor grayColor].CGColor;
    _deleteAudit.layer.shadowOffset = CGSizeMake(0.5,1);
    _deleteAudit.layer.shadowRadius = 1;
    _deleteAudit.layer.shadowOpacity = 0.3;
    _deleteAudit.alpha = 0.1;
    [_deleteAudit addTarget:self action:@selector(deleteAudit) forControlEvents:UIControlEventTouchUpInside];
    
    _animation =[CABasicAnimation animationWithKeyPath:@"position"];
    [_animation setDuration:0.6];
    
    flag = 1;
    
    [[HttpManager instance] requestLessonDetailCell:@{
                                                      STUDENT_NUMBER:TEST_STUDENT_NUMBER, STUDENT_PASSWORD:TEST_STUDENT_PASSWORD,LESSON_ID:_lesson_id
                                                      } success:^(id responseObject) {
        _responseDic = responseObject;
        NSLog(@"%@",_responseDic);
        
        NSString * result = _responseDic[@"result"];
        if([result isEqualToString:Request_LessonDetail_Success]){//请求成功
            _commmentArray = _responseDic[@"comment"];
            [_tableView reloadData];
        }
        else{
            
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
-(void)viewWillAppear:(BOOL)animated{
    [[HttpManager instance] requestLessonDetailCell:@{STUDENT_NUMBER:TEST_STUDENT_NUMBER, STUDENT_PASSWORD:TEST_STUDENT_PASSWORD,LESSON_ID:_lesson_id} success:^(id responseObject) {
        _responseDic = responseObject;
        
        NSString * result = _responseDic[@"result"];
        _lesson_id = _responseDic[@"lesson_id"];
        if([result isEqualToString:Request_LessonDetail_Success]){//请求成功
            _commmentArray = _responseDic[@"comment"];
            [_tableView reloadData];
        }
        else{
            
        }
    } failure:^(NSError *error) {
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"网络出错!" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
        [alert show];
        NSLog(@"%@",error);
    }];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LessonDetailHeader * headerview;
    if(section == 0){
        headerview = [[LessonDetailHeader alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 100)];
        [headerview setInfo:_responseDic];
        [headerview.commandBtn addTarget:self action:@selector(clickCommandBtn) forControlEvents:UIControlEventTouchUpInside];
        return headerview;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 105;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_commmentArray count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //复用机制，是根据identifier进行复用的
    static NSString * identifer = @"lessondetailCell";
    MyCommandTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if(cell == nil){
        cell = [[MyCommandTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSMutableDictionary * info = [_commmentArray objectAtIndex:indexPath.row];
    //mutating method sent to immutable object  报错：不可变变量使用了可变处理
    NSString * lesson_name = _responseDic[@"lesson_name"];
    [cell setLessonName:lesson_name];
    [cell setInfo:info];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(void)clickCommandBtn{
    DoCommandViewController * docommandVC = [[DoCommandViewController alloc]init];
    [docommandVC setLesson_id:_lesson_id];
    [self.navigationController pushViewController:docommandVC animated:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{//滑动过程
    _deleteAudit.alpha = 0.1;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{//停止滑动
    _endoffset = scrollView.contentOffset.y;
    _deleteAudit.alpha = 1;
}
-(void)setLesson_id:(NSString *)lesson_id{
    _lesson_id = lesson_id;
}
-(void)setIsAudit:(NSString *)isAudit{
    if([isAudit isEqualToString:@"0"]){//不是旁听的
    }
    else{//是旁听的
        [self.view addSubview:_deleteAudit];
    }
}
-(void)deleteAudit{
    
    UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"亲，确定移除这门旁听吗？" delegate:self cancelButtonTitle:@"是的呀" otherButtonTitles:@"点错了", nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0){//点击了确认按钮
        //标记刚刚登陆
        [[HttpManager instance] requestLessonDeleteAudit:@{
                                                           STUDENT_NUMBER:TEST_STUDENT_NUMBER, STUDENT_PASSWORD:TEST_STUDENT_PASSWORD,
                                                            @"audit_lesson_id":_lesson_id
                                                           } success:^(id responseObject) {
            _responseDic = responseObject;
            //课程数据
            NSString * result = _responseDic[@"result"];
            if([result isEqualToString:@"successed"]){
                //写入移除课程标记，lesson页面进行刷新
                [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"deleteaudit"];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        } failure:^(NSError *error) {
            UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"网络出错!" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
            [alert show];
            NSLog(@"%@",error);
        }];
    }
}

@end














