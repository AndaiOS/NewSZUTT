//
//  ProfileViewController.m
//  SZUTT
//
//  Created by 安达 on 16/3/24.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "ProfileViewController.h"
#import "UserInformationViewController.h"
#import "LoginViewController.h"
#import "NewTagViewController.h"
#import "PasswordViewController.h"
#import "ShareViewController.h"
@interface ProfileViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>{
    UIButton * _logoutBtn;
}
@property(nonatomic,strong) UITableView * tableView;

@end

@implementation ProfileViewController
//viewDisLoad只会在第一次的时候运行，之后就是viewWillAppear
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.barTintColor = MainBlueColor;
    
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, Screen_Width, Screen_Height-40) style:UITableViewStyleGrouped];
    _tableView.backgroundView = nil;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorColor = [UIColor grayColor];
    
    
    
    
    //tableView的助手是ViewController
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _tableView.bounces = YES;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"profileCell"];
    [self.view addSubview:_tableView];
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    [rightBtn setTintColor:[UIColor whiteColor]];
    
    // Do any additional setup after loading the view.
}
//实现protocal
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
        return 2;
    else if(section == 1)
        return 1;
    else
        return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"profileCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSArray *titleNameArray = @[NSLocalizedString(@"个人信息", nil),
                                NSLocalizedString(@"偏好设置", nil),
                                NSLocalizedString(@"修改密码", nil),
                                NSLocalizedString(@"退出登录", nil)];
    if(indexPath.section == 0){
        cell.textLabel.text = titleNameArray[indexPath.row + indexPath.section];
        if(indexPath.row == 0)
            cell.imageView.image = [UIImage imageNamed:@"profile_drafts_icon"];
        else
            cell.imageView.image = [UIImage imageNamed:@"profile_tag"];
    }
    else if(indexPath.section == 1){
        cell.textLabel.text = titleNameArray[2 + indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"profile_privacy"];
        
    }
    else{
        cell.textLabel.text = titleNameArray[3 + indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"profile_logout"];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.textColor = [UIColor grayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell ;
}
-(CGFloat)tableView :(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(CGFloat)tableView :(UIImageView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==0) {
        switch (indexPath.row) {
            case 0:{
                UserInformationViewController *userVC = [[UserInformationViewController alloc] init];
                userVC.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:userVC animated:YES];
                break;
            }
            case 1:{
                NewTagViewController * tagVC = [[NewTagViewController alloc]init];
                tagVC.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:tagVC animated:YES];
                break;
            }
            default:
                break;
        }
    }
    else if(indexPath.section == 1){
        PasswordViewController * pwVC = [[PasswordViewController alloc]init];
        pwVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:pwVC animated:YES];
//        PasswordViewController * pwVC = [[PasswordViewController alloc]init];
//        [self.navigationController pushViewController:pwVC animated:YES];        
    }
    else{
        //ActionSheet也是有协议的，必须实现代理，否则会报警告
        UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"退出登录" otherButtonTitles:nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
        [actionSheet showInView:self.view];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//消除选中状态
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //0为破坏性按钮
    //1为取消
    if(buttonIndex == 0){
        
        //在NSUserDefaults存入一个标记
        [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"clicklogout"];
        
        //消除查询学分纪录
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"had_elective_mark"];
        
        [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"already"];
        
        LoginViewController * loginVC = [[LoginViewController alloc]init];
        UINavigationController * loginNav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        [self presentViewController:loginNav animated:YES completion:nil];
    }
}


-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"viewDidDisappear");
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear");
}
//内存不足的时候调用这个方法
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)clickRightButton:(id)sender{
    ShareViewController * shareVC = [[ShareViewController alloc]init];
    shareVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:shareVC animated:YES];
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
