//
//  DiscoverViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/3/30.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "DiscoverViewController.h"
#import "SwitchView.h"
#import "TeacherPhoneViewController.h"
#import "MyCommandTableViewCell.h"
#import "NotificationTableViewCell.h"
#import "TeacherCell.h"
#include "NewClubEventViewController.h"
#include "CommandingTableViewCell.h"
#include "HotLessonTableViewCell.h"
#include "DiscoverCommandTableViewCell.h"
#import "LessonDetailViewController.h"
#import "AroundSZUViewController.h"


@interface DiscoverViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating>{
    NSInteger _currentIndex;
    UITableView * _teacherTableView;
    UITableView * _notificationTableView;
    UITableView * _lessonTableView;
    UITableView * _commandTableView;
    float titleHeight;
    float backgroundViewHeight;
    SwitchView * _switchView;
    NSMutableArray * _collegeName;
    NSMutableArray * _notificationName;
    UIView * _imgView;
    UIImageView * _AnimationImg;
    UILabel * _label;
    NSInteger _currentPage;//当前页码
    UISearchController * _searchController;
    NSInteger _currentImgPage;//图片轮播的当前页
    CABasicAnimation *animation;//立体旋转动画
    NSInteger _isClickLeftBtn;
    NSDictionary * responseDic;
    NSArray * _commentArray;//吐槽帝数据
    NSMutableArray * _commentID;//吐槽帝评论ID
}

@property (strong,nonatomic) UIScrollView * scrollView;
@property (strong,nonatomic) UIScrollView * imageScrollView;
@property (strong,nonatomic) UIPageControl * pageControl;
@property (strong,nonatomic) NSTimer * timer;
@property (strong,nonatomic) NSTimer * timer2;
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    self.navigationController.navigationBar.barTintColor = MainBlueColor;
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    _isClickLeftBtn = 1;
    //UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc]initWithTitle:@"调整顺序" style:UIBarButtonItemStyleDone target:self action:@selector(clickLeftButton:)];
    //self.navigationItem.leftBarButtonItem = leftBtn;
    //[leftBtn setTintColor:[UIColor whiteColor]];
    
    titleHeight = 35;//和SwitchView中定义的一致
    backgroundViewHeight = Screen_Height - 64 - titleHeight - 44;
    self.view.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    
    _switchView = [[SwitchView alloc]initWithFrame:CGRectMake(0, 64, Screen_Width, titleHeight)];
    [self.view addSubview:_switchView];//按钮控件加在主视图上
    
    //将滑动图片改在switchView上
    _imgView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width/2 - 70 - 35, 96, 104, 2)];
    _imgView.backgroundColor = MainRedColor;
    //[_imgView setBackgroundColor:[UIColor colorWithRed:255.0/255 green:255.0/255 blue:255.0/255 alpha:0.8]];
    _imgView.layer.cornerRadius = 1;
    _imgView.layer.shadowColor = [UIColor grayColor].CGColor;
    _imgView.alpha = 0.8;
    [_imgView addSubview:_label];
    [self.view addSubview:_imgView];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64 + titleHeight, Screen_Width, backgroundViewHeight)];
    _scrollView.alwaysBounceHorizontal = YES;//横向滑动
    _scrollView.bounces = YES;
    _scrollView.pagingEnabled = YES;//支持翻页
    _scrollView.delegate = self;
    _scrollView.userInteractionEnabled = YES;//可交互
    _scrollView.showsHorizontalScrollIndicator = NO;//是否显示水平滚动条
    _scrollView.showsVerticalScrollIndicator = NO;//是否显示竖直滚动条
    _scrollView.tag = 1;
    [self.view addSubview:_scrollView];

    //scrollView实际上真正的大小，而不是被frame限制的大小
    [_scrollView setContentSize:CGSizeMake(Screen_Width * 2, backgroundViewHeight)];
    [_scrollView setContentOffset:CGPointMake(0, 0)];
    //实现无缝连接，但是要和pagingEnabled进行配套
    [_scrollView scrollRectToVisible:CGRectMake(0, 0, Screen_Width, backgroundViewHeight) animated:YES];

    _collegeName = [[NSMutableArray alloc]initWithObjects:@"材料学院",@"传播学院",@"创业学院",@"电子科学与技术学院",@"法学院",@"管理学院",@"高尔夫学院",@"化学与化工学院",@"建筑与规划设计学院",@"计算机与软件学院",@"经济学院",@"机电与控制工程学院",@"数学与计算科学学院",@"师范学院",@"生命科学学院",@"社会科学学院",@"土木工程学院",@"体育部",@"文学院",@"物理科学与技术学院",@"外国语学院",@"信息工程学院",@"艺术与设计学院",@"医学院", nil];
    
    _notificationName = [[NSMutableArray alloc]initWithObjects:@"社团活动",@"深大周边",@"轻松一刻", nil];
    [self initTableView];
    
    //3D立体旋转动画
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.delegate =self;
    //第一个参数是旋转的角度，第二个参数是绕x轴旋转，第三个参数是绕y轴旋转，第四个参数是绕中心点旋转
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI,1.0,0.0,0.0)];
    //执行时间
    //animation的duration为0.5，而animation2的duration为0.5*2,再设置repeatCount为2
    animation.duration = 0.5;
    animation.cumulative = YES;//累积的
    //执行次数
    animation.repeatCount = 1;
    animation.autoreverses= YES ;//是否执行逆动画
    
    // Do any additional setup after loading the view.
}
-(void)initTableView{
    //CGRectMake参数意义：相对于父视图的x,y,宽度和高度
    
    _teacherTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, backgroundViewHeight)style:UITableViewStylePlain];
    [_scrollView addSubview:_teacherTableView];
    _teacherTableView.backgroundColor = MainWhiteColor;
    
     _teacherTableView.showsVerticalScrollIndicator = NO;//因为是横向滑动，设置纵向滚动条为NO
    _teacherTableView.dataSource = self;
    _teacherTableView.delegate = self;
    _teacherTableView.tag = 11;
    _teacherTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    __weak typeof (UIScrollView *) _sc = _scrollView;
    
    _switchView.ButtonActionBlock = ^(int buttonTag){
        _currentIndex = buttonTag - 10000;
        
        [_sc scrollRectToVisible:CGRectMake(Screen_Width * (_currentIndex - 1),0,Screen_Width,backgroundViewHeight ) animated:YES];
        
        
        [_scrollView setContentOffset:CGPointMake(Screen_Width * (_currentIndex - 1), 0)];
        
        if(_currentIndex == 1){
            
        }
        else if(_currentIndex == 2){
            if(_notificationTableView == nil){//首次进入还未加载
                
                //初始化轮播scrollView
                _imageScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Width * 0.562)];
                _imageScrollView.backgroundColor = MainWhiteColor;
                _imageScrollView.alwaysBounceHorizontal = YES;//横向滑动
                _imageScrollView.bounces = YES;
                _imageScrollView.pagingEnabled = YES;//支持翻页
                _imageScrollView.delegate = self;
                _imageScrollView.userInteractionEnabled = YES;//可交互
                _imageScrollView.showsHorizontalScrollIndicator = NO;//是否显示水平滚动条
                _imageScrollView.showsVerticalScrollIndicator = NO;//是否显示竖直滚动条
                [_notificationTableView addSubview:_imageScrollView];
                [_imageScrollView setContentSize:CGSizeMake(Screen_Width * 3, Screen_Width * 0.562)];
                [_imageScrollView setContentOffset:CGPointMake(0, 0)];
                //实现无缝连接，但是要和pagingEnabled进行配套
                //[_imageScrollView scrollRectToVisible:CGRectMake(0, 0, Screen_Width, backgroundViewHeight) animated:YES];
                _imageScrollView.tag = 2;
                
                //设置轮播图片参数
                CGFloat imageWidth = _imageScrollView.frame.size.width;
                CGFloat imageHeight = _imageScrollView.frame.size.height;
                CGFloat imageY = 0;
                NSInteger totalimageCount = 3;
                for(int i=0;i<totalimageCount;i++){
                    UIImageView * imageView = [[UIImageView alloc]init];
                    CGFloat imageX = i * imageWidth;
                    imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight);
                    if(i == 0)
                        imageView.image = [UIImage imageNamed:@"img0.jpg"];
                    else if(i==1)
                        imageView.image = [UIImage imageNamed:@"img2.jpg"];
                    else
                        imageView.image = [UIImage imageNamed:@"img1.jpg"];
                    _imageScrollView.showsHorizontalScrollIndicator = NO;
                    [_imageScrollView addSubview:imageView];
                }
                
                
                _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((Screen_Width - 50)/2, 120, 50, 15)];
                _pageControl.numberOfPages = 3;
                _pageControl.pageIndicatorTintColor = [UIColor redColor];
                _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
                [_notificationTableView addSubview:_pageControl];
                
                [self addTimer];//添加定时器
                
                _notificationTableView = [[UITableView alloc]initWithFrame:CGRectMake(Screen_Width,0,Screen_Width,backgroundViewHeight) style:UITableViewStyleGrouped];
                [_notificationTableView setBackgroundColor:[UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1]];
                [_notificationTableView setTableHeaderView:_imageScrollView];
                [_scrollView addSubview:_notificationTableView];
                _notificationTableView.showsVerticalScrollIndicator = NO;
                _notificationTableView.tag = 12;
                _notificationTableView.dataSource = self;
                _notificationTableView.delegate = self;
                _notificationTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            }
        }
    };
    _currentIndex = 1;//回到首页面
}
-(void)nextImage{
    _currentImgPage = (int)_pageControl.currentPage;
    if(_currentImgPage == 1){
        _currentImgPage = 0;
    }
    else{
        _currentImgPage ++;
    }
    CGFloat endx = _currentImgPage * _imageScrollView.frame.size.width;
    _imageScrollView.contentOffset = CGPointMake(endx,0);
    
    [_imageScrollView scrollRectToVisible:CGRectMake(endx,0, Screen_Width, backgroundViewHeight) animated:YES];
    
}
-(void)addTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{//这个参数scrollView不能和全局变量一样的名字
    _label.hidden = NO;
    //每一页的宽度是一个屏幕的宽度
    CGFloat pageWidth = _scrollView.frame.size.width;
    //要知道当前的页码，逻辑是找到x的偏移量减去半个页面的宽度再除以全页面宽度，在0-0.5之间还是本页面，在0.5-1之间就是下一个页面
    _currentPage = floor( (_scrollView.contentOffset.x - pageWidth/(2)) / pageWidth) + 1;//12.345返回12.000
    //设置首页面
    if(_currentPage == 0){
        [_scrollView scrollRectToVisible:CGRectMake(0, 0, Screen_Width, backgroundViewHeight) animated:YES];
        [_scrollView setContentOffset:CGPointMake(0, 0)];
    }
    
    //设置尾页面
    else if(_currentPage == 1){
        [_scrollView scrollRectToVisible:CGRectMake(Screen_Width * 1, 0, Screen_Width, backgroundViewHeight) animated:YES];
        [_scrollView setContentOffset:CGPointMake(Screen_Width * 1,0)];
    }
    
    _currentIndex = _currentPage + 1;
    [_switchView swipeAction:(int)(10000 + _currentPage + 1)];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //x 属于  [0.0000,960.00000]
    if(scrollView.tag == 1){
        _currentPage = floor( (_scrollView.contentOffset.x - _scrollView.frame.size.width/(2)) / _scrollView.frame.size.width) + 1;
        if(_currentPage != 0){
            [self.navigationItem.leftBarButtonItem setTitle:@""];
        }
        else{
            [self.navigationItem.leftBarButtonItem setTitle:@"调整顺序"];
        }
        if(scrollView.contentOffset.x != 0)
            [_imgView setCenter:CGPointMake(Screen_Width/2 - 70 - 35 + 51 + scrollView.contentOffset.x/3 , 96 + 1)];
        
        NSLog(@"%f",scrollView.contentOffset.x);
        
        //[0\191\255 , 225\225\255] / [255\255\255 , 0,191,255]
        // x [0,320,640,960]
        
        //NSLog(@"%f",scrollView.contentOffset.x);
    }
    
    //图片轮播
    else if(scrollView.tag == 2){
        CGFloat scrollViewWidth = _imageScrollView.frame.size.width;
        CGFloat x = _imageScrollView.contentOffset.x;
        int page = (x + scrollViewWidth/2)/scrollViewWidth;
        _pageControl.currentPage = page;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView.tag == 11){
        return 22;//一共22个学院
    }
    else if(tableView.tag == 12){
        return 4;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView.tag == 11){
        NSString * identifier = @"teacherCell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = _collegeName[indexPath.row];
        cell.textLabel.textColor = [UIColor grayColor];
        [cell.textLabel setFont:[UIFont systemFontOfSize:13]];
        cell.imageView.image = [UIImage imageNamed:@"college_icon"];
        return cell;
    }
    else if(tableView.tag == 12){
        NSString * identifier = @"notificationCell";
        if(indexPath.row == 0){
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            if(cell == nil){
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            [cell setBackgroundColor:[UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        else{
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if(cell == nil){
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell.textLabel.text = _notificationName[indexPath.row-1];//因为row从1开始
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.textColor = [UIColor grayColor];
                [cell.textLabel setFont:[UIFont systemFontOfSize:13]];
                cell.imageView.image = [UIImage imageNamed:@"clubevent_icon"];

            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        return nil;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView.tag == 11){
        return 44;
    }
    else if(tableView.tag == 12){
        if(indexPath.row == 0)
            return 10;
        return 44;
    }
    return 88;
}
//自适应高度
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView.tag == 11){
        return 44;
    }
    else if(tableView.tag == 12){
        return 44;
    }
    return 88;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //教师电话
    if(tableView.tag == 11){
        //BUG!!!! alloc是分配内存空间，init是初始化
        TeacherPhoneViewController * _teacherVC = [[TeacherPhoneViewController alloc]init];
        _teacherVC.hidesBottomBarWhenPushed=YES;
        [_teacherVC setCollegename:_collegeName[indexPath.row]];
        [self.navigationController pushViewController:_teacherVC animated:YES];
    }
    else if(tableView.tag == 12){
        if(indexPath.row == 1){
            NewClubEventViewController * _clubVC = [[NewClubEventViewController alloc]init];
            _clubVC.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:_clubVC animated:YES];
        }
        else if(indexPath.row == 2){
            AroundSZUViewController *szuVC = [[AroundSZUViewController alloc]init];
            szuVC.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:szuVC animated:YES];
        }
        else{
            
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//消除选中状态
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(tableView.tag == 11){
        return 4;
    }
    return 0;
}
//单元格可以移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.tag == 11)
        return YES;
    return NO;
}
//单元格编辑风格
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //    需要的移动行
    NSInteger fromRow = [sourceIndexPath row];
    //    获取移动某处的位置
    NSInteger toRow = [destinationIndexPath row];
    //    从数组中读取需要移动行的数据
    id object = [_collegeName objectAtIndex:fromRow];
    //    在数组中移动需要移动的行的数据
    [_collegeName removeObjectAtIndex:fromRow];
    //    把需要移动的单元格数据在数组中，移动到想要移动的数据前面
    [_collegeName insertObject:object atIndex:toRow];
}
-(void)clickLeftButton:(id)sender{
    
    if(_currentPage == 0){
        if(_isClickLeftBtn == 1){
            [_teacherTableView setEditing:YES animated:YES];
            [self.navigationItem.leftBarButtonItem setTitle:@"完成"];
            _isClickLeftBtn = 0;
        }
        else{
            [_teacherTableView setEditing:NO animated:YES];
            [self.navigationItem.leftBarButtonItem setTitle:@"调整顺序"];
            _isClickLeftBtn = 1;
        }
    }
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}
-(void)clickcommandingBtn{
    LessonDetailViewController * lessonVC = [[LessonDetailViewController alloc]init];
    lessonVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:lessonVC animated:YES];
}
-(void)clickdeleteBtn:(MyCommandTableViewCell *)cell{//点击了删除评论按钮
    
    NSLog(@"%@",cell.comment_id);
//    NSString * comment_id = [NSString stringWithFormat:@"%d",cell.comment_id];
//    
//    [[HttpManager instance] requestDiscoverDeleteCommand:@{STUDENT_NUMBER:@"2014222100", STUDENT_PASSWORD:@"96E79218965EB72C92A549DD5A330112",COMMENT_ID : comment_id} success:^(id responseObject) {
//        NSDictionary * responseDic = responseObject;
//        if([responseDic[@"result"] isEqualToString:@"successed"]){
//            
//        }
//    } failure:^(NSError *error) {
//        NSLog(@"%@",error);
//    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
