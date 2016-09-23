//
//  ViewController.m
//  SphereMenu
//
//  Created by Anda on 16-4-11.
//  Copyright (c) 2016年 TU YOU. All rights reserved.
//

#import "ViewController.h"
#import "NewRecommandViewController.h"
#import "Masonry.h"
#import "ZLDropDownMenuUICalc.h"
#import "ZLDropDownMenuCollectionViewCell.h"
#import "ZLDropDownMenu.h"
#import "NSString+ZLStringSize.h"
#import "LessonTableViewCell.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPSessionManager.h"
#import "HttpManager.h"
#import "ProgressView.h"
#import <CoreLocation/CoreLocation.h>

@interface NewRecommandViewController () <UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,ZLDropDownMenuDelegate, ZLDropDownMenuDataSource,UISearchResultsUpdating,CLLocationManagerDelegate>{
    UISearchBar * _searchBars;
    UISearchController * _searchController;
    UITableView * _tableView;
    UIRefreshControl * _refreshControl;
    CABasicAnimation *animation;//移动s
    NSMutableArray * _dataList;
    NSMutableArray * _searchList;
    //需要在plist文件中添加两个字段，才能弹出提示框
    CLLocationManager * _locationManager;
    NSArray * _dataArray;
    int selected[3];
    NSArray * lessondata;
    NSString * _longtitde;//纬度
    NSString * _latitude; //经度
    UIAlertView * _baseAlert;
    NSString * _searchString;
    ProgressView * _progressView;
    NSTimer * _timer;
    UIAlertController * alert;
    UIAlertAction * defaultAction;
}

@end

@implementation NewRecommandViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:1];
    
    _refreshControl = [[UIRefreshControl alloc]init];
    _refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"亲，数据在赶来的路上～"];
    [_refreshControl addTarget:self action:@selector(referencetableView:) forControlEvents:UIControlEventValueChanged];
    _refreshControl.tintColor = MainBlueColor;
    
    
    _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    //设置开始搜索时背景显示与否
    _searchController.dimsBackgroundDuringPresentation = NO;
    // searchResultsDataSource 就类似 UITableViewDataSource
    _searchController.searchResultsUpdater = self;
    
    _searchController.searchBar.barTintColor = MainBlueColor;
    _searchController.searchBar.placeholder = @"想搜啥都行";
    _searchController.hidesNavigationBarDuringPresentation = NO;
    _searchController.searchBar.searchBarStyle = UISearchBarStyleProminent;
    self.navigationItem.titleView = _searchController.searchBar;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, Screen_Width, Screen_Height-50)];
    [_tableView setTintColor:[UIColor blueColor]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView addSubview:_refreshControl];
    [self.view addSubview:_tableView];
    
    _dataList = [[NSMutableArray alloc]init];
    _searchList = [[NSMutableArray alloc]init];

    animation =[CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:1.0];
    
    
    _mainTitleArray = @[@"综合", @"院系", @"评价"];
    _subTitleArray = @[
                       @[@"无筛选",@"距离优先", @"性别优先",@"时间优先"],
                       @[@"全院", @"本院优先",@"外院优先"],
                       @[@"评价优先",@"无筛选"],
                       ];
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = MainBlueColor;
    [topView setFrame:CGRectMake(0, 0, Screen_Width, 64)];
    [self.view addSubview:topView];

    ZLDropDownMenu *menu = [[ZLDropDownMenu alloc] init];
    [self.view addSubview:menu];
    menu.delegate = self;
    menu.dataSource = self;
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    
    //默认 0 6 7
    selected[0] = 0;
    selected[1] = 6;
    selected[2] = 7;
    
    
    _locationManager = [[CLLocationManager alloc] init];
    
    _locationManager.delegate = self;
    
    // 设置定位精度
    // kCLLocationAccuracyNearestTenMeters:精度10米
    // kCLLocationAccuracyHundredMeters:精度100 米
    // kCLLocationAccuracyKilometer:精度1000 米
    // kCLLocationAccuracyThreeKilometers:精度3000米
    // kCLLocationAccuracyBest:设备使用电池供电时候最高的精度
    // kCLLocationAccuracyBestForNavigation:导航情况下最高精度，一般要有外接电源时才能使用
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;//1米
    
    // distanceFilter是距离过滤器，为了减少对定位装置的轮询次数，位置的改变不会每次都去通知委托，而是在移动了足够的距离时才通知委托程序
    // 它的单位是米，这里设置为至少移动1000再通知委托处理更新;
    _locationManager.distanceFilter = 10.0f; // 如果设为kCLDistanceFilterNone，则每秒更新一次;
    
    
    
    
    _searchString = [[NSString alloc]init];
    _longtitde = [[NSString alloc]init];
    _latitude = [[NSString alloc]init];
    
    //设置经纬度初始值
    _longtitde = @"113.9300";
    _latitude = @"22.5300";
    
    [self requestRecommand];
}


- (NSInteger)numberOfColumnsInMenu:(ZLDropDownMenu *)menu
{
    return self.mainTitleArray.count;
}

- (NSInteger)menu:(ZLDropDownMenu *)menu numberOfRowsInColumns:(NSInteger)column
{
    return [self.subTitleArray[column] count];
}

- (NSString *)menu:(ZLDropDownMenu *)menu titleForColumn:(NSInteger)column
{
    return self.mainTitleArray[column];
}

- (NSString *)menu:(ZLDropDownMenu *)menu titleForRowAtIndexPath:(ZLIndexPath *)indexPath
{
    NSArray *array = self.subTitleArray[indexPath.column];
    return array[indexPath.row];
}

- (void)menu:(ZLDropDownMenu *)menu didSelectRowAtIndexPath:(ZLIndexPath *)indexPath
{
    //NSArray *array = self.subTitleArray[indexPath.column];
    
    if(indexPath.column == 0 && indexPath.row == 1){//选择了距离优先
        UIAlertView* alert1=[[UIAlertView alloc]initWithTitle:@"提示" message:@"亲，我们需要获取你的位置" delegate:self cancelButtonTitle:@"来吧!" otherButtonTitles:@"算咯", nil];
            [alert1 show];
    }
    [self getSelectedIndex:indexPath.column row:indexPath.row];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //判断光标是否在搜索框内
    if (_searchController.active) {
        return [_searchList count];
    }else{
        return [lessondata count];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"recommandCell";
    LessonTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[LessonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell setAnimation];
    }
    
    if(_searchController.active){
        NSDictionary * info = [_searchList objectAtIndex:indexPath.row];
        [cell initDataWithInfo:info];
    }
    else{
        NSDictionary * info = [lessondata objectAtIndex:indexPath.row];
        [cell initDataWithInfo:info];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {

    _searchString = [_searchController.searchBar text];
    [self requestRecommand];
    [_tableView reloadData];
    
}


- (void)presentSearchController:(UISearchController *)searchController{
    NSString * str = searchController.searchBar.text;
    NSLog(@"%@",str);
}
-(void)referencetableView:(UIRefreshControl *)control
{
    [self requestRecommand];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(void)timeChanged:(id)sender{
    
    _progressView.percent += 0.005f;
    NSLog(@"进度条：%f",_progressView.percent);
    if(_progressView.percent * 100 > 100){
        [_timer invalidate];
        [_progressView removeFromSuperview];
    }
}
-(void)requestRecommand{
    
    if(!_searchController.active)
        [_refreshControl beginRefreshing];
    if(_searchController.active)
        if(_searchController.searchBar.text.length == 0)
            return ;
    NSString * search_array = [NSString stringWithFormat:@"[%d,%d,%d]",selected[0],selected[1],selected[2]];
    NSLog(@"%@",search_array);
    [[HttpManager instance] requestLessonRecommand:@{
                                                     
                                                     STUDENT_NUMBER:TEST_STUDENT_NUMBER, STUDENT_PASSWORD:TEST_STUDENT_PASSWORD,
                                                     SEARCH_NAME : _searchString,
                                                     LONGITUDE : _longtitde,
                                                     LATITUDE : _latitude,
                                                     SEARCH_ARRAY : search_array,
                                                     LESSON_LOCATION : _index
                                                     } success:^(id responseObject) {
                                                         
                                                         [self performDismiss];
                                                         NSDictionary * responseDic = responseObject;
                                                         if([responseObject[@"result"] isEqualToString:@"successed"]){
                                                             if(!_searchController.active){
                                                                 lessondata = responseDic[@"lesson_data"];
                                                                 for (int i = 0; i < [lessondata count]; i ++) {
                                                                     [_dataList addObject:[lessondata objectAtIndex:i]];
                                                                 }
                                                             }
                                                             else
                                                                 _searchList = responseDic[@"lesson_data"];
                                                             [_refreshControl endRefreshing];
                                                             [_tableView reloadData];
                                                         }
                                                         else{
                                                             [self setTitle:@"提示" setMessage:@"已更新" setActionTitle:@"好的"];
                                                         }
                                                         
                                                     } failure:^(NSError *error) {
                                                         
                                                         [self setTitle:@"提示" setMessage:@"网络出错!" setActionTitle:@"好的"];
                                                         
                                                         NSLog(@"%@",error);
                                                     }];
}
-(void)getSelectedIndex:(NSInteger)column row:(NSInteger)row{
    
    //正在选择中
    //显示 “数据正在赶来～”
    
    NSArray *array = self.subTitleArray[column];
    //无筛选 距离优先 性别优先 时间优先
    //全院 本院优先 外院优先
    //评价优先
    //[0,1,2,3]
    //[0,1,2]
    //[0]
    
    NSArray * myarray = @[@"无筛选",@"距离优先",@"性别优先",@"时间优先",@"本院优先",@"外院优先",@"全院",@"评价优先",@"无筛选"];
    int i = 0;
    for(i=0;i<=8;i++){
        if([array[row] isEqualToString:@"无筛选"]){
            if(row == 0){
                selected[0] = 0;
            }
            else{
                selected[2] = 8;
            }
            continue;
        }
        if([array[row] isEqualToString:myarray[i]]){
            if(i <= 3){
                selected[0] = i;
            }
            else if(i <= 6){
                selected[1] = i;
            }
            else{
                selected[2] = i;
            }
        }
    }
    //如果是选择了距离优先，暂时先不进行网络请求
    if(selected[0] == 1){
        
    }
    else{
        
        
        _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数据更新中" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [_baseAlert show];
        
        [self requestRecommand];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0){//点击了确认获取地理位置按钮
        //开始定位
        [_locationManager requestAlwaysAuthorization];
        [_locationManager startUpdatingLocation];
    }
}
// ios 6.0以上SDK版本使用，包括6.0。
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *cl = [locations objectAtIndex:0];
    NSLog(@"纬度--%f",cl.coordinate.latitude);
    NSLog(@"经度--%f",cl.coordinate.longitude);
    float latitude = cl.coordinate.latitude;
    float longtitde = cl.coordinate.longitude;
    _latitude = [NSString stringWithFormat:@"%f",latitude];
    _longtitde = [NSString stringWithFormat:@"%f",longtitde];
    [manager stopUpdatingLocation];//停止获取位置
    _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数据更新中" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [_baseAlert show];

    [self requestRecommand];
}
//获取定位失败回调方法
#pragma mark - location Delegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] == kCLErrorDenied)
    {
        NSLog(@"拒绝访问");
        //访问被拒绝
    }
    if ([error code] == kCLErrorLocationUnknown) {
        //无法获取位置信息
        NSLog(@"无法获取位置信息");
    }
    if( [error code] == kCLErrorNetwork){
        NSLog(@"无可用源");
    }
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //将经度显示到label上
    //self.longitude.text = [NSString stringWithFormat:@"%lf", newLocation.coordinate.longitude];
    NSLog(@"经度：%lf",newLocation.coordinate.longitude);
    //将纬度显示到label上
    //self.latitude.text = [NSString stringWithFormat:@"%lf", newLocation.coordinate.latitude];
    NSLog(@"纬度：%lf",newLocation.coordinate.latitude);
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
}

-(void) performDismiss:(NSTimer *)timer
{
    [_baseAlert dismissWithClickedButtonIndex:0 animated:NO];
}
-(void) performDismiss{
    [_baseAlert dismissWithClickedButtonIndex:0 animated:NO];
}
//移除searchController
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (_searchController.active) {
        _searchController.active = NO;
        [_searchController.searchBar removeFromSuperview];
    }
}
-(void)setIndex:(NSString *)index{
    _index = index;
}
-(void)setTitle:(NSString *)title setMessage:(NSString *)message setActionTitle:(NSString *)actiontitle{
    alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    defaultAction = [UIAlertAction actionWithTitle:actiontitle style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
