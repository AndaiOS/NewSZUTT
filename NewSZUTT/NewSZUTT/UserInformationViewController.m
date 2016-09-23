//
//  UserInformationViewController.m
//  SZUTT
//
//  Created by 安达 on 16/3/24.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "UserInformationViewController.h"
#import "UserMarkViewController.h"
@interface UserInformationViewController ()<UITableViewDataSource,UITableViewDelegate,UICollisionBehaviorDelegate>{
    UIDynamicAnimator * _animator;
    UIGravityBehavior * _gravityBeahvior;
    UICollisionBehavior * _collisionBehavior;
    UIDynamicItemBehavior * _itemBehavior;
    UISnapBehavior * _snapBehavior;
    UIImageView * _image;
    UIImageView * _image2;
    UIAlertView * _baseAlert;
}
@property(nonatomic,strong) UITableView * tableView;

@end

@implementation UserInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIBarButtonItem * backitem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.backBarButtonItem = backitem;
    
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"学分查询" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    [rightBtn setTintColor:[UIColor whiteColor]];
    
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorColor = [UIColor lightGrayColor];
    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
    
    _image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    [_image setFrame:CGRectMake(100, 100, 30, 30)];
    _image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    [_image2 setFrame:CGRectMake(120, 200, 30, 30)];
    [self.view addSubview:_image];
    [self.view addSubview:_image2];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
//    //重力对象
//    _gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[_image]];
//    //设置重力的方向（是一个角度）
//    _gravityBeahvior.angle=(M_PI_2-M_PI_4);
//    //设置重力的加速度,重力的加速度越大，碰撞就越厉害
//    _gravityBeahvior.magnitude=100;
//    //设置重力的方向（是一个二维向量）
//    _gravityBeahvior.gravityDirection=CGVectorMake(0, 1);
//    
//    
//    
//    
//    //碰撞检测
//    _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[_image,_image2]];
//    //参照视图的边框成为碰撞的边框
//    _collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
//    // 2.碰撞检测行为
//    CGPoint startP = CGPointMake(0, 160);
//    CGPoint endP = CGPointMake(320, 400);
//    [_collisionBehavior addBoundaryWithIdentifier:@"line1" fromPoint:startP toPoint:endP];
//    
//    //捕捉行为
//    CGPoint tapPoint = CGPointMake(100,500);
//    _snapBehavior = [[UISnapBehavior alloc] initWithItem:_image2 snapToPoint:tapPoint];
//    _snapBehavior.damping = 0.5f;  //剧列程度
//    [_animator addBehavior:_snapBehavior];
//    
//    //通用子项的属性设置
//    _itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[_image,_image2]];
//    _itemBehavior.elasticity = 0.5;//弹性系数
//    _itemBehavior.friction = 0.5;//摩擦力系数
//    _itemBehavior.resistance = 0.5;//阻力系数
//    
//    //执行物理仿真
//    [_animator addBehavior:_gravityBeahvior];
//    [_animator addBehavior:_collisionBehavior];
//    [_animator addBehavior:_itemBehavior];
    
    // Do any additional setup after loading the view.
}
- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
    NSLog(@"好疼，我撞在%f,%f，%@",p.x,p.y,identifier);
}
- (void)tapped:(UITapGestureRecognizer *)gesture {
    
    NSString *filename = [NSString stringWithFormat:@"bubble_1"];
    UIImage *image = [UIImage imageNamed:filename];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];
    
    CGPoint tappedPos = [gesture locationInView:gesture.view];
    imageView.center = tappedPos;
    
    [_gravityBeahvior addItem:imageView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
        return 3;
    else
        return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"";
    if(indexPath.section == 0)
        identifier = @"firstuserinfoCell";
    else
        identifier = @"seconduserinfoCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell setBackgroundColor:[UIColor whiteColor]];
    }
    NSArray * nametitleArray = @[@"昵称",@"学号",@"姓名",@"必修",@"选修"];
    //网络请求数据
    
    
    NSString * student_number = [[NSUserDefaults standardUserDefaults] objectForKey:@"number"];;
    NSString * student_nickname = [[NSUserDefaults standardUserDefaults] objectForKey:@"nickname"];;
    NSString * student_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];;
    
    NSString * had_elective_mark = [[NSUserDefaults standardUserDefaults]valueForKey:@"had_elective_mark"];
    NSString * had_required_mark = [[NSUserDefaults standardUserDefaults]valueForKey:@"had_required_mark"];
    NSString * need_elective_mark = [[NSUserDefaults standardUserDefaults]valueForKey:@"need_elective_mark"];
    NSString * need_required_mark = [[NSUserDefaults standardUserDefaults]valueForKey:@"need_required_mark"];
    
    NSArray * requestData = @[student_nickname,student_number,student_name,@"85/105",@"25/35",@"10/15",@"10/15",@"5/10"];
    if(indexPath.section == 0){
        cell.textLabel.text = nametitleArray[indexPath.row + indexPath.section];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = [UIColor grayColor];
        UILabel *label = [ [ UILabel alloc ] initWithFrame: CGRectMake((Screen_Width - 100)*0.95,cell.textLabel.frame.origin.y, 100.0, 45.0) ];
        label.text = requestData[indexPath.row + indexPath.section];
        label.textAlignment = UITextLayoutDirectionRight;
        label.textColor = [ UIColor grayColor ];
        label.font = [ UIFont systemFontOfSize:13 ];
        label.highlightedTextColor = [ UIColor blackColor ];
        label.backgroundColor = [ UIColor whiteColor ];
        [cell addSubview:label];
        
        
    }
    else{
        cell.textLabel.text = nametitleArray[3 + indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = [UIColor grayColor];
        UILabel *label = [ [ UILabel alloc ] initWithFrame: CGRectMake((Screen_Width - 100)*0.95,cell.textLabel.frame.origin.y, 100.0, 44.0) ];
        
        label.text = requestData[indexPath.row + 3];
        label.textAlignment = UITextLayoutDirectionRight;
        label.textColor = [ UIColor grayColor ];
        label.font = [ UIFont systemFontOfSize:13 ];
        label.shadowOffset = CGSizeMake(0, -1);
        label.highlightedTextColor = [ UIColor blackColor ];
        label.backgroundColor = [ UIColor whiteColor ];
        [cell addSubview:label];
        
        if(had_elective_mark == nil){
            cell.hidden = YES;
        }
        else{
            if(indexPath.row == 0)
                label.text = [NSString stringWithFormat:@"%@/%@",had_required_mark,need_required_mark];
            else
                label.text = [NSString stringWithFormat:@"%@/%@",had_elective_mark,need_elective_mark];
            cell.hidden = NO;
            //存入一个标记，证明已经查到了数据并且显示出来
            [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"already"];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView :(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(CGFloat)tableView :(UIImageView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return 10;
    else
        return 10;
}

-(CGFloat)tableView :(UIImageView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

-(void)clickRightButton:(id)sender{
    //跳转至查询学分页面
    UserMarkViewController * _userVC = [[UserMarkViewController alloc]init];
    [self.navigationController pushViewController:_userVC animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    NSString * flag = [[NSUserDefaults standardUserDefaults]objectForKey:@"already"];
    if([flag isEqualToString:@""]){
        //没有成功，返回本界面，不作处理
    }
    if([flag isEqualToString:@"0"]){
        //没有成功，返回本界面，不作处理
    }
    else if([flag isEqualToString:@"1"]){
        
    }
    else{
        [_tableView reloadData];
    }
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



