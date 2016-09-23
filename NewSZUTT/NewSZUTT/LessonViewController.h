//
//  LessonViewController.h
//  NewSZUTT
//
//  Created by 安达 on 16/3/30.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PulsingHaloLayer.h"

@interface LessonViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView * collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) PulsingHaloLayer *halo;//脉冲动画效果
@property (nonatomic, strong) NSArray *mainTitleArray;
@property (nonatomic, strong) NSArray *subTitleArray;
@end
