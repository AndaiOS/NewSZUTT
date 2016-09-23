//
//  NewTagViewController.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/25.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "NewTagViewController.h"
@interface NewTagViewController(){
    UIView * _view;
    UIButton * _tagBtnArray[12];
    UIButton * _saveBtn;
    NSInteger flag;
    NSArray * tagname;
}

@end

@implementation NewTagViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1]];
    
    _view = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.05, (Screen_Height - Screen_Height * 0.5)/1.8, Screen_Width * 0.9, Screen_Height * 0.5)];
    _view.backgroundColor = [UIColor whiteColor];
    _view.layer.cornerRadius = 8;
    _view.layer.backgroundColor = [UIColor whiteColor].CGColor;
    _view.layer.shadowOffset = CGSizeMake(0.5,1);
    _view.layer.shadowRadius = 1;
    _view.layer.shadowOpacity = 0.3;
    [self.view addSubview:_view];
    
    int viewwidth = _view.frame.size.width;
    float viewx = 0;
    int viewheight = _view.frame.size.height;
    int viewy = 0;
    int tagwidth = 60;
    int tagheight = 30;
    int rowpadding = (viewwidth-3*tagwidth)/4;
    int liepadding = (viewheight-4*tagheight)/5;
    
    //取出已经保存的被选择的下标
    //NSArray * array = [[NSUserDefaults standardUserDefaults]objectForKey:@"selectedTag"];
    
    NSInteger i = 0;
    for(i=0;i<12;i++){
        _tagBtnArray[i] = [[UIButton alloc]initWithFrame:CGRectMake(viewx + rowpadding * (i%3+1) + (i%3) * tagwidth , viewy + liepadding * (i/3+1) + (i/3) * tagheight, tagwidth, tagheight)];
        [_tagBtnArray[i] setBackgroundColor:[UIColor colorWithRed:175.0/255 green:175.0/255 blue:175.0/255 alpha:1]];
        [_tagBtnArray[i] setTitle:[tagArray objectAtIndex:i] forState:UIControlStateNormal];
        _tagBtnArray[i].titleLabel.font = [UIFont systemFontOfSize:11];
        _tagBtnArray[i].alpha = 0.3;
        _tagBtnArray[i].titleLabel.textColor = [UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1];
        _tagBtnArray[i].layer.cornerRadius = 4;
        _tagBtnArray[i].tag = i + 1;
        
        _tagBtnArray[i].showsTouchWhenHighlighted=YES;
        [_tagBtnArray[i] addTarget:self action:@selector(clickTag:) forControlEvents:UIControlEventTouchUpInside];
        [_view addSubview:_tagBtnArray[i]];
    }
    _saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_saveBtn setFrame:CGRectMake(Screen_Width * 0.0665, _view.frame.size.height + _view.frame.origin.y + 25, Screen_Width * 0.867, Screen_Height * 0.0599)];
    [_saveBtn setTitle:@"保  存" forState:UIControlStateNormal];
    [_saveBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];//设置加粗
    [_saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_saveBtn addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    _saveBtn.backgroundColor = [UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:1];
    _saveBtn.layer.masksToBounds = YES;
    _saveBtn.layer.cornerRadius = 4;
    [self.view addSubview:_saveBtn];
    
    

}
-(void)clickTag:(id)sender{
    UIButton* btn = (UIButton*)sender;
    int tag = (int)btn.tag;
    if(tag > 100){//目前是蓝色，要变回灰色
        flag --;
        [_tagBtnArray[tag-101] setBackgroundColor:[UIColor colorWithRed:175.0/255 green:175.0/255 blue:175.0/255 alpha:1]];
        _tagBtnArray[tag-101].alpha = 0.3;
        _tagBtnArray[tag-101].tag = tag - 100;
    }
    else{//灰色，要变成蓝色
        if(flag == 6){
            
        }
        else{
            [_tagBtnArray[tag-1] setBackgroundColor:[UIColor colorWithRed:0.0/255 green:191.0/255 blue:255.0/255 alpha:1]];
            _tagBtnArray[tag-1].alpha = 1.0;
            _tagBtnArray[tag-1].tag = tag + 100;
            flag ++;
        }
    }
    //坑，tag恒为正数
}
-(void)save{
    //可变数组(期望容量设置为3)
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:12];
    //直接添加
    for(int i =0  ; i< 12;i++){
        [mutableArray insertObject:[NSString stringWithFormat:@"%ld",(long)_tagBtnArray[i].tag] atIndex:i];
    }
    NSArray * array = [NSArray arrayWithArray:mutableArray];
    [[NSUserDefaults standardUserDefaults]setObject:array forKey:@"selectedTag"];
    //存入flag
    [[NSUserDefaults standardUserDefaults]setInteger:flag forKey:@"selectedFlag"];
}
-(void)setbtnTitle{
    
}

@end
