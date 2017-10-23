//
//  WYPhotoView.m
//  WYCloudMusicPhoto
//
//  Created by 刘禄昌 on 2017/10/23.
//  Copyright © 2017年 llc. All rights reserved.
//

#import "WYPhotoView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width

static NSString * const ID = @"cell";

@implementation WYPhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    FlowLayout *layout = ({
        FlowLayout *layout = [[FlowLayout alloc] init];
        layout.itemSize = CGSizeMake(160, 160);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = 50;
        // 设置最小行间距
        layout.minimumLineSpacing = 50;
        
        CGFloat margin = (ScreenW - 160) * 0.5;
        layout.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin);
        
        
        layout;
    });
    
    UICollectionView *collectionView = ({
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor greenColor];
        //collectionView.center = self.center;
        collectionView.frame = self.bounds;
        collectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:collectionView];
        
        collectionView.dataSource = self;
        collectionView;
    });
    
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class])  bundle:nil] forCellWithReuseIdentifier:ID];
    
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"%ld",indexPath.item + 1];
    
    cell.image = [UIImage imageNamed:imageName];
    
    return cell;
};

@end
