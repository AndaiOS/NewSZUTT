//
//  DoCommandViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/16.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "DoCommandViewController.h"
#import "RatingBar.h"

@interface DoCommandViewController ()<RatingBarDelegate,UITextViewDelegate>{
    UIView * _containerView;
    UITextView * _commandTextView;
    RatingBar * _ratingBar;
    UILabel * _ratingMark;
    UIView * _tagcontainerView;
    UIButton * _tagBtnArray[12];
    NSArray * _btnTitle;
    UIButton * _submitBtn;
    CGFloat _currentMark;
    
    UIAlertController * alert;
    UIAlertAction * defaultAction;
    UIAlertView * _baseAlert;
    NSInteger alreadySelected;//已经选择的标签数量
}

@end

@implementation DoCommandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];

    _containerView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width*0.05, 74, Screen_Width*0.9, Screen_Height * 0.75)];
    _containerView.backgroundColor = [UIColor whiteColor];
    _containerView.layer.cornerRadius = 4;
    _containerView.layer.shadowColor = [UIColor grayColor].CGColor;
    _containerView.layer.shadowOffset = CGSizeMake(1, 1);
    _containerView.layer.shadowOpacity = 3;
    [self.view addSubview:_containerView];
    
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ratingBar:(RatingBar *)ratingBar ratingChanged:(float)newRating{
    if (_ratingBar == ratingBar) {
        _currentMark = newRating;
        NSLog(@"评分条的当前结果为:%.1f",newRating);
        NSString *srtingOfValue = [NSString stringWithFormat:@"%.1f",_currentMark];
        _ratingMark.text = srtingOfValue;
    }
}
- (void)textViewDidChange:(UITextView *)textView
{
    
}
//光标点在了textview范围内
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    NSLog(@"1");
}
-(void)viewWillAppear:(BOOL)animated{
    
    _commandTextView = [[UITextView alloc]initWithFrame:CGRectMake(_containerView.frame.size.width*0.05, 10, _containerView.frame.size.width * 0.9, 210)];
    _commandTextView.layer.cornerRadius = 4;
    _commandTextView.layer.borderColor = [[UIColor grayColor]CGColor];
    _commandTextView.layer.borderWidth = 0.3;
    _commandTextView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;//加上这行代码光标从左上角开始
    _commandTextView.font = [UIFont systemFontOfSize:13];
    _commandTextView.text = @"";
    _commandTextView.textColor = [UIColor lightGrayColor];
    _commandTextView.keyboardType = UIKeyboardTypeDefault;
    [_containerView addSubview:_commandTextView];
    //
    _ratingBar = [[RatingBar alloc]initWithFrame:CGRectMake(_containerView.frame.size.width * 0.3 , _commandTextView.frame.origin.y + _commandTextView.frame.size.height + 10, _containerView.frame.size.width * 0.35, 25)];
    _ratingBar.isIndicator = NO;
    [_ratingBar setImageDeselected:@"iconfont-xingunselected" halfSelected:@"star_half" fullSelected:@"star_all" andDelegate:self];
    [_containerView addSubview:_ratingBar];
    //
    _ratingMark = [[UILabel alloc]initWithFrame:CGRectMake(_ratingBar.frame.size.width + _ratingBar.frame.origin.x + 10, _ratingBar.frame.origin.y, 35, 15)];
    _ratingMark.textColor = [UIColor grayColor];
    _ratingMark.textAlignment = NSTextAlignmentCenter;
    _ratingMark.font = [UIFont systemFontOfSize:13];
    [_containerView addSubview:_ratingMark];
    //
    _tagcontainerView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width*0.05, _ratingBar.frame.origin.y + _ratingBar.frame.size.height + 10, _containerView.frame.size.width*0.9, 100)];
    _tagcontainerView.backgroundColor = [UIColor whiteColor];
    [_containerView addSubview:_tagcontainerView];
    //
    
    
    _btnTitle = @[@"不点名",@"作业少",@"不考试",@"妹子多",@"欧巴多",@"老师严",@"路程近",@"很生动",@"进度快",@"重基础",@"容易过",@"评分高"];
    
    //
    //
    _submitBtn = [[UIButton alloc]initWithFrame:CGRectMake(_containerView.frame.size.width * 0.05, 380, _containerView.frame.size.width * 0.9, _containerView.frame.size.height * 0.0699)];
    _submitBtn.backgroundColor = MainBlueColor;
    [_submitBtn setTitle:@"吐槽一波" forState:UIControlStateNormal];
    _submitBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    _submitBtn.layer.cornerRadius = 4;
    [_submitBtn addTarget:self action:@selector(clickSubmitBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:_submitBtn];
  
    
    int viewwidth = _tagcontainerView.frame.size.width;
    float viewx = 0;
    int viewheight = _tagcontainerView.frame.size.height;
    int viewy = 0;
    int tagwidth = 40;
    int tagheight = 18;
    int rowpadding = (viewwidth-4*tagwidth)/5;
    int liepadding = (viewheight-3*tagheight)/4;
    NSInteger i = 0;
    for(i=0;i<12;i++){
        _tagBtnArray[i] = [[UIButton alloc]initWithFrame:CGRectMake(viewx + rowpadding * (i%4+1) + (i%4) * tagwidth , viewy + liepadding * (i/4+1) + (i/4) * tagheight, tagwidth, tagheight)];
        [_tagBtnArray[i] setBackgroundColor:[UIColor colorWithRed:175.0/255 green:175.0/255 blue:175.0/255 alpha:1]];
        [_tagBtnArray[i] setTitle:_btnTitle[i] forState:UIControlStateNormal];
        _tagBtnArray[i].titleLabel.font = [UIFont systemFontOfSize:9];
        _tagBtnArray[i].alpha = 0.3;
        _tagBtnArray[i].titleLabel.textColor = MainWhiteColor;
        _tagBtnArray[i].layer.cornerRadius = 4;
        _tagBtnArray[i].tag = i + 1;//[1,12]
        _tagBtnArray[i].showsTouchWhenHighlighted=YES;
        [_tagBtnArray[i] addTarget:self action:@selector(clickTag:) forControlEvents:UIControlEventTouchUpInside];
        [_tagcontainerView addSubview:_tagBtnArray[i]];
    }
}
//收起输入框
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![_commandTextView isExclusiveTouch]) {
        [_commandTextView resignFirstResponder];
    }
}
-(void)clickTag:(id)sender{
    UIButton* btn = (UIButton*)sender;
    long tag = btn.tag;
    if(tag > 100){//目前是蓝色，要变回灰色
        alreadySelected --;
        [_tagBtnArray[tag-101] setBackgroundColor:[UIColor colorWithRed:175.0/255 green:175.0/255 blue:175.0/255 alpha:1]];
        _tagBtnArray[tag-101].alpha = 0.3;
        _tagBtnArray[tag-101].tag = tag - 100;
    }
    else{//灰色，要变成蓝色
        if(alreadySelected == 3){
            [self setTitle:@"提示" setMessage:@"最多选3个标签哦" setActionTitle:@"好滴"];
        }
        else{
            alreadySelected ++;
            [_tagBtnArray[tag-1] setBackgroundColor:[UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:1]];
            _tagBtnArray[tag-1].alpha = 0.8;
            _tagBtnArray[tag-1].tag = tag + 100;
        }
    }
    //坑，tag恒为正数
}
-(void)clickSubmitBtn:(id)sender{
    
    NSString * commandtext = _commandTextView.text;
    if(commandtext.length == 0){
        [self setTitle:@"提示" setMessage:@"评论不能为空哦！" setActionTitle:@"好滴"];
    }
    else if(commandtext.length > 100){
        [self setTitle:@"提示" setMessage:@"评论过长哦！" setActionTitle:@"好滴"];
    }
    else{
        
        //评分的数值
        NSString * mark = _ratingMark.text;
        if(mark == nil){
            mark = @"0";
        }
        
        //获取标签,tag > 100 就是选中了
        NSString * tagarray = [[NSString alloc]init];//要拼接起来，作为参数
        for(int i = 0; i < 12; i ++){
            
            if(_tagBtnArray[i].tag > 100){
                NSString * tag = _btnTitle[i];
                tagarray = [NSString stringWithFormat:@"%@，%@",tagarray,tag];
            }
            else
                continue;
        }
        if(tagarray.length > 0){
            tagarray = [tagarray substringFromIndex:1];
        }
        else{
            tagarray = @"";
        }
        [[HttpManager instance] requestLessonAddCommand:@{STUDENT_NUMBER:TEST_STUDENT_NUMBER, STUDENT_PASSWORD:TEST_STUDENT_PASSWORD,LESSON_ID:_lesson_id,TAG_NAME:tagarray,COMMENT_MARK:mark,COMMENT_DETAIL : commandtext} success:^(id responseObject) {
            NSDictionary * responseDic = responseObject;
            
            NSString * reason = responseDic[@"reason"];
            
            if([reason isEqualToString:Request_AddComment_Success]){
                _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"发布成功" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                
                [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
                [_baseAlert show];
                [self.navigationController popViewControllerAnimated:YES];  
            }
            else{
                
            }
        } failure:^(NSError *error) {
            _baseAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络出错" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            
            [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            [_baseAlert show];
            NSLog(@"%@",error);
        }];
        
    }
}
-(void)setTitle:(NSString *)title setMessage:(NSString *)message setActionTitle:(NSString *)actiontitle{
    alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    defaultAction = [UIAlertAction actionWithTitle:actiontitle style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)setLesson_id:(NSString *)lesson_id{
    _lesson_id = lesson_id;
}
-(void) performDismiss:(NSTimer *)timer
{
    [_baseAlert dismissWithClickedButtonIndex:0 animated:NO];
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
