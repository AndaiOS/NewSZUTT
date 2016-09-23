//
//  NewRecommandViewController.h
//  NewSZUTT
//
//  Created by 安达 on 16/4/10.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewRecommandViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSArray *mainTitleArray;
@property (nonatomic, strong) NSArray *subTitleArray;

@property (nonatomic ,strong) NSString * index;
-(void)setIndex:(NSString *)index;
@end
