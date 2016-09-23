//
//  CommandingTableViewCell.m
//  NewSZUTT
//
//  Created by 安达 on 16/4/15.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "CommandingTableViewCell.h"
#import "CommandingCollectionViewCell.h"

@interface CommandingTableViewCell()<UICollectionViewDataSource,UICollectionViewDelegate>{
    UIView * _containerView;
    UIButton * _leftBtn;
    UIButton * _rightBtn;
    UICollectionViewFlowLayout * _flowLayout;
    UICollectionView * _collectionView;
}

@end

@implementation CommandingTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = MainWhiteColor;
        _containerView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width * 0.05, 0, Screen_Width*0.9, 120)];
        [_containerView setBackgroundColor:[UIColor whiteColor]];
        _containerView.layer.cornerRadius = 8;
        _containerView.layer.shadowOpacity = 0.5;
        _containerView.layer.shadowOffset = CGSizeMake(0.5, 1);
        _containerView.layer.shadowRadius = 1;
        _containerView.layer.shadowColor = [UIColor grayColor].CGColor;
        [self.contentView addSubview:_containerView];
        
        //浮层
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        [_flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];//横向移动
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[CommandingCollectionViewCell class] forCellWithReuseIdentifier:@"CommandingCollectionViewCell"];
        [_collectionView setFrame:CGRectMake(90, (_containerView.frame.size.height - 85)/2, Screen_Width-40-90, 85)];
        [self.contentView addSubview:_collectionView];
        
        
        _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, (_containerView.frame.size.height - 85)/2, 85, 85)];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"club_icon"] forState:UIControlStateNormal];
        _leftBtn.layer.cornerRadius = 8;
        [self.contentView addSubview:_leftBtn];
        
        _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(Screen_Width-35, (_containerView.frame.size.height - 85)/2, 35, 85)];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"club_more"] forState:UIControlStateNormal];
        _rightBtn.layer.cornerRadius = 8;
        [self.contentView addSubview:_rightBtn];
    }
    return self;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;//看到10个
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * Identifier = @"CommandingCollectionViewCell";
    CommandingCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    cell.layer.cornerRadius = 8;
    [cell setLessonCell];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(85, 85);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0f;
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark - scrollerViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f",scrollView.contentOffset.x);
    float x = scrollView.contentOffset.x;
    if(x >= 760.00){
        
        
        
    }
}

@end
