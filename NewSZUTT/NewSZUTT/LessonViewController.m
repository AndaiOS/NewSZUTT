//
//  LessonViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/3/30.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "LessonViewController.h"
#import "NewRecommandViewController.h"
#import "LessonTableHeader.h"
#import "UILabel+SizeToFit.h"
#import "LessonDetailViewController.h"
#import "NewLessonViewController.h"
#import "HomeWorkViewController.h"
#import "MyAlertView.h"
#import "LoginViewController.h"
#import "UIImageView+WebCache.h"
@interface LessonViewController (){
    NSInteger i;
    NSArray * lessonflag;
    LessonTableHeader * _tableheader;
    NSArray * lessondata;
    NSInteger lessoni;//[lesson count]
    NSInteger isLessoned[36];
    NSString * LessonID[36];
    NSString * IsAudit[36];
    NSDictionary * responseDic;
    UIImageView * auditImage;
    int timeflag; //白天或者晚上
    NSString * currentTime;
    UILongPressGestureRecognizer * longPressGr;
    NSInteger longPressItemIndex;//长按下标
    UIAlertController * alert;
    UIAlertAction * defaultAction;
}

@end

@implementation LessonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.barTintColor = MainBlueColor;
    
    NSURL* imagePath1 = [NSURL URLWithString:@"http://s15.sinaimg.cn/middle/9914f9fdhbc6170891ebe&690"];
    
    UIImageView * background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"blank"]];
    [background setFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    background.contentMode = UIViewContentModeScaleAspectFit;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:background.image]];
    
    
    //图片缓存的基本代码，就是这么简单
    [background sd_setImageWithURL:imagePath1];
    
//    //用block 可以在图片加载完成之后做些事情
//    [self.image2 sd_setImageWithURL:imagePath2 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//        NSLog(@"这里可以在图片加载完成之后做些事情");
//        
//    }];
    timeflag = 1;
    
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc]initWithTitle:@"切换" style:UIBarButtonItemStyleDone target:self action:@selector(clickLeftButton:)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    [leftBtn setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"作业" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    [rightBtn setTintColor:[UIColor whiteColor]];
    
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    i = 1;
    lessonflag = [[NSArray alloc]initWithObjects:@"1/2",@"3/4",@"5/6",@"7/8",@"9/10",@"11/12", nil];
    
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //flowLayout.headerReferenceSize = CGSizeMake(300.0f, 50.0f);  //设置head大小
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 44, Screen_Width, Screen_Height - 48) collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    //注册Cell，必须要有
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [self.view addSubview:self.collectionView];
    _tableheader = [[LessonTableHeader alloc]initWithFrame:CGRectMake(0, 64, Screen_Width, 44)];
    [self.view addSubview:_tableheader];
    
    lessoni = 0;
    
    longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
    longPressGr.minimumPressDuration = 1.0;
    [self.collectionView addGestureRecognizer:longPressGr];
    
    [self updateLessonTimeLable];
}
-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        CGPoint point = [gesture locationInView:self.collectionView];
        NSIndexPath * indexPath = [self.collectionView indexPathForItemAtPoint:point];//锁定某一个
        if(indexPath == nil)
            return ;
        else{
            longPressItemIndex = indexPath.item;
            
            //判断是否是旁听课程
            if([IsAudit[longPressItemIndex]isEqualToString:@"1"]){
                //弹出提示框
                UIAlertView* alert1=[[UIAlertView alloc]initWithTitle:@"提示" message:@"亲，要移除该旁听吗?" delegate:self cancelButtonTitle:@"不想上了" otherButtonTitles:@"再听听呗", nil];
                //local declearation instance variable 变量名与函数同名
                [alert1 show];
            }
        }
        //add your code here
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0){//点击了移除旁听按钮
        [[HttpManager instance] requestLessonDeleteAudit:@{
                                                           STUDENT_NUMBER:TEST_STUDENT_NUMBER, STUDENT_PASSWORD:TEST_STUDENT_PASSWORD,
                                                           @"audit_lesson_id":LessonID[longPressItemIndex]
                                                           } success:^(id responseObject) {
                                                               responseDic = responseObject;
                                                               NSLog(@"%@",responseDic);
                                                               //课程数据
                                                               NSString * result = responseDic[@"result"];
                                                               if([result isEqualToString:@"successed"]){
                                                                   //写入移除课程标记，lesson页面进行刷新
                                                                   [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"deleteaudit"];
                                                                   [self viewWillAppear:YES];//刷新页面
                                                               }
                                                           } failure:^(NSError *error) {
                                                               [self setTitle:@"警告" setMessage:@"网络出错!" setActionTitle:@"知道了"];
                                                               NSLog(@"%@",error);
                                                           }];
    }
}
-(void)getCurrentTime{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"HH:mm:ss"];
    currentTime=[dateformatter stringFromDate:senddate];
}
-(void)viewWillAppear:(BOOL)animated{
    //取出是否有需要刷新的请求
    NSString * addaudit = [[NSUserDefaults standardUserDefaults]objectForKey:@"addaudit"];
    NSString * deleteaudit = [[NSUserDefaults standardUserDefaults]objectForKey:@"deleteaudit"];
    if([addaudit isEqualToString:@"1"] || [deleteaudit isEqualToString:@"1"]){
        
        //将isLessoned  LessonID  IsAudit设为最初的状态
        for(int j =0 ;j < 36;j++){
            isLessoned[j] = 0;
            LessonID[j] = @"";
            IsAudit[j] = @"";
        }
        [self updateLessonTimeLable];
        //重新写入，防止多次刷新
        [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"addaudit"];
        [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"deleteaudit"];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 36;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowRadius = 8;
    cell.layer.borderColor=[UIColor colorWithRed:59.0/255 green:140.0/255 blue:255.0/255 alpha:1].CGColor;
    cell.layer.borderWidth=0.1;
    //
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, (cell.frame.size.height-20)/2, cell.frame.size.width, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    if(indexPath.item % 6 == 0){//第几大节课
        label.text = [NSString stringWithFormat:@"%@",lessonflag[indexPath.row/6]];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = MainBlueColor;
        cell.backgroundColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:0.5];
        cell.layer.cornerRadius = 4;
        cell.layer.shadowColor = [UIColor blackColor].CGColor;
        cell.layer.shadowRadius = 2;
        cell.layer.borderWidth = 0.0;
    }
    else{
        label.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:10];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:10];
        label.numberOfLines = 0;
        label.frame = CGRectMake((Screen_Width/7-Screen_Width/9)/2, 5, Screen_Width/9, 60);
        
        //当前的cell格子坐标
        int currentIndex = (int)indexPath.item;
        
        //转换成我的坐标系
        //currentIndex = 7  -->  2  同理  2 --> 7
        int targetIndex = ( currentIndex % 6 - 1) * 6 + currentIndex / 6 + 1;
        
        //NSLog(@"targetIndex = %d",targetIndex);
        
        NSInteger weeknumber = [responseDic[@"weeknumber"]intValue];
        [_tableheader setWeekNumber:weeknumber];
        
        //在lessondata中查找
        for(i=0;i<[lessondata count];i++){
            //NSLog(@"i的值为%d",i);
            NSArray * lesson = [lessondata objectAtIndex:i];
            //NSLog(@"lesson的值%@",lesson);
            NSArray * lessontime_location = [lesson valueForKey:@"lessontime_location"];
            //NSLog(@"lessontime的值%@",lessontime_location);
            if([[lessontime_location objectAtIndex:0] intValue] == -1){
                continue;
            }
            for(int j=0;j<3;j++){
                //NSLog(@"lessontime_location = %d",[[lessontime_location objectAtIndex:j] intValue]);
                if(targetIndex == [[lessontime_location objectAtIndex:j] intValue]){ //本格子是有课的
                    isLessoned[indexPath.item] = 1;
                    LessonID[indexPath.item] = [lesson valueForKey:@"lesson_id"];
                    IsAudit[indexPath.row] = [lesson valueForKey:@"isAudit"];
                    NSLog(@"是否是旁听:%@",IsAudit[indexPath.row]);
                    if([IsAudit[indexPath.row] isEqualToString:@"1"]){//旁听课程
                        auditImage = [[UIImageView alloc]initWithFrame:CGRectMake(Screen_Width / 7 - 15, Screen_Width / 7 * 1.7 - 15, 15,15)];
                        auditImage.image = [UIImage imageNamed:@"isAudit"];
                    }
                    //放置脉冲动画在格子右上角
                    //_halo = [PulsingHaloLayer layer];
                    //_halo.position = CGPointMake(Screen_Width / 7 + Screen_Width / 7 ,0 );
                    
                    
                    
                    NSLog(@"%@",[lesson valueForKey:@"lesson_institute_name"]);
                    
                    NSString * lesson_location = [lesson valueForKey:@"lesson_location"];
                    NSString * lesson_name = [lesson valueForKey:@"lesson_name"];
                    
                    //text包含 课程名称 上课时间 上课地点
                    NSString * lessoninformation = [NSString stringWithFormat:@"%@@%@",lesson_name,lesson_location];
                    label.text = lessoninformation;
                    
                    int randomi = arc4random() % 5;
                    switch (randomi) {
                        case 0:
                            cell.backgroundColor = LessonBlueGreenColor;
                            break;
                        case 1:
                            cell.backgroundColor = LessonBlueColor;
                            break;
                        case 2:
                            cell.backgroundColor = LessonRedColor;
                            break;
                        case 3:
                            cell.backgroundColor = LessonGreenColor;
                            break;
                        case 4:
                            cell.backgroundColor = LessonPurpleColor;
                            break;
                        default:
                            break;
                    }
                    cell.alpha = 0.8;
                }//有格子的if后括号
            }//for后括号
        }//for后括号
        cell.layer.cornerRadius = 4;
    }//else后括号
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    if([IsAudit[indexPath.row] isEqualToString:@"1"])
        [cell.contentView addSubview:auditImage];
    [cell.layer addSublayer:_halo];
    [cell.contentView insertSubview:label atIndex:1];
    return cell;
}



#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.item % 6 == 0){//第几大节
        return CGSizeMake(Screen_Width/7, Screen_Width/7 * 1.7);
    }
    return CGSizeMake(Screen_Width/7, Screen_Width/7 * 1.7);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 0, 5);//第一个参数控制section之间的空隙
}
//横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0 && indexPath.row % 6 != 0){
        if(isLessoned[indexPath.item] == 1){
            
            
            LessonDetailViewController * lessondetailVC = [[LessonDetailViewController alloc]init];
            lessondetailVC.hidesBottomBarWhenPushed=YES;
            [lessondetailVC setLesson_id:LessonID[indexPath.item]];
            [lessondetailVC setIsAudit:IsAudit[indexPath.row]];
            [self.navigationController pushViewController:lessondetailVC animated:YES];
            
            
        }
        else{
            NewRecommandViewController * recommandVC = [[NewRecommandViewController alloc]init];
            //当前的cell格子坐标
            int currentIndex = (int)indexPath.item;
            
            //转换成我的坐标系
            //currentIndex = 7  -->  2  同理  2 --> 7
            int targetIndex = ( currentIndex % 6 - 1) * 6 + currentIndex / 6 + 1;
            NSString * index = [NSString stringWithFormat:@"%d",targetIndex];
            [recommandVC setIndex:index];
            recommandVC.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:recommandVC animated:YES];
            
        }
    }
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)updateLessonTimeLable{
    
    NSString * str = TEST_STUDENT_NUMBER;
    if(str.length == 0){
        LoginViewController * loginVC = [[LoginViewController alloc]init];
        UINavigationController * loginNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        [self presentViewController:loginNav animated:YES completion:nil];
        return ;
    }
    
    
    
    [[HttpManager instance] requestLessonTimeTable:@{STUDENT_NUMBER:TEST_STUDENT_NUMBER, STUDENT_PASSWORD:TEST_STUDENT_PASSWORD} success:^(id responseObject) {
        responseDic = responseObject;
        //课程数据
        lessondata = responseDic[@"lesson_data"];
        [_collectionView reloadData];
        
    } failure:^(NSError *error) {
        [self setTitle:@"警告" setMessage:@"网络出错!" setActionTitle:@"知道了"];
        NSLog(@"%@",error);
    }];
}
-(void)clickLeftButton:(id)sender{
    UIImageView * background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    
    if(timeflag == 1){
        background.image = [UIImage imageNamed:@"moon"];
        timeflag = 0;
    }
    else{
        background.image = [UIImage imageNamed:@"blank"];
        timeflag = 1;
    }
    background.contentMode = UIViewContentModeScaleAspectFit;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:background.image]];
}
-(void)clickRightButton:(id)sender{
    HomeWorkViewController * homeworkVC = [[HomeWorkViewController alloc]init];
    [self.navigationController pushViewController:homeworkVC animated:YES];
}
-(void)performDismiss{
    
}
-(void)setTitle:(NSString *)title setMessage:(NSString *)message setActionTitle:(NSString *)actiontitle{
    alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    defaultAction = [UIAlertAction actionWithTitle:actiontitle style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
