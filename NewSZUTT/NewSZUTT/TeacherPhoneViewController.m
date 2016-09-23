//
//  TeacherPhoneViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/7.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "TeacherPhoneViewController.h"
#import "TeacherTableViewCell.h"

@interface TeacherPhoneViewController()<UITableViewDataSource,UITableViewDelegate>{
    UITableView * _tableView;
    NSMutableArray * _indexArray; //索引数组
    UIButton * _saveBtn;//保存按钮
    
    NSMutableArray * _teacherallarray;//所有老师的信息
    NSArray * _teacherinletterarray;//首字母相同的一组老师信息数组
    NSInteger _teachercount;//老师的数量
    
    NSInteger flag[26];
    
    NSDictionary * _dicteacherarray;
    UIAlertView * _baseAlert;
    NSDictionary * responseDic;
}

@end

@implementation TeacherPhoneViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //索引的颜色
    _tableView.sectionIndexColor = MainBlueColor;
    //索引被选中的颜色
    _tableView.sectionIndexTrackingBackgroundColor = MainBlueColor;
    _indexArray = [[NSMutableArray alloc]init];
    
    
    [[HttpManager instance] requestDiscoverTeacherPhone:@{STUDENT_NUMBER:TEST_STUDENT_NUMBER, STUDENT_PASSWORD:TEST_STUDENT_PASSWORD,TEACHER_COLLEGE:_collegename} success:^(id responseObject) {
        responseDic = responseObject;
        //NSLog(@"%@",responseDic);
        //老师数据
        NSInteger flagi = 0;
        
        NSString * result = responseDic[@"result"];
        if([result isEqualToString:Request_AllTeacher_Success]){ //请求成功
            for (char c = 'A'; c <= 'Z'; c ++) {
                NSString * letter = [NSString stringWithFormat:@"%c",c];//将字母作为参数
                NSArray * teacherinletter = responseDic[letter];
                //NSLog(@"%@",teacherinletter);
                if([teacherinletter count] > 0){//以该字母为首的老师存在
                    [_indexArray addObject:[NSString stringWithFormat:@"%c",c]];//将该字母加入索引数组
                    _teacherinletterarray = teacherinletter;//赋值
                    flag[flagi] = [teacherinletter count];
                    _teachercount += [teacherinletter count];//计算总数量
                    
                    [_teacherallarray addObjectsFromArray:teacherinletter];//将一组信息加入更大的数组
                    flagi ++;
                    NSLog(@"%@",[_teacherinletterarray valueForKey:@"teacher_address"]);
                }
                else{
                    continue;
                }
            }
        }else{
            _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:responseObject[@"reason"] delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            [_baseAlert show];
            NSLog(@"请求失败！");
        }
        [_tableView reloadData];
    } failure:^(NSError *error) {
        _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络出错!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
        [_baseAlert show];
        [self.navigationController popToRootViewControllerAnimated:YES];
        NSLog(@"%@",error);
    }];
    
    
    //创建串行队列
    dispatch_queue_t  queue= dispatch_queue_create("reload_teacherinfo_array", NULL);
    //第一个参数为串行队列的名称，是c语言的字符串
    //第二个参数为队列的属性，一般来说串行队列不需要赋值任何属性，所以通常传空值（NULL）
    //2.添加任务到队列中执行
    dispatch_async(queue, ^{
    });
    [self.view addSubview:_tableView];
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return _indexArray;
}
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    NSInteger count = 0;
    for(NSString * character in _indexArray)
    {
        if([character isEqualToString:title])
        {
            return count;
        }
        count ++;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return flag[section];//网络请求的数量
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_indexArray count];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_indexArray objectAtIndex:section];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"teacherCell";
    TeacherTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[TeacherTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSString * letter = _indexArray[indexPath.section];
    NSArray * teacherinletter = responseDic[letter];
    NSDictionary * info = [teacherinletter objectAtIndex:indexPath.row];
    [cell setInfo:info];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}
-(void)save{
    
}
-(void) performDismiss:(NSTimer *)timer
{
    [_baseAlert dismissWithClickedButtonIndex:0 animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
