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

+ (instancetype)initWithFrame:(CGRect)frame imageArray:(NSMutableArray *)imageArray selectItemBlock:(SelectItemBlock)selectItemBlock{
    
    WYPhotoView *wyPhotoView = [[WYPhotoView alloc] initWithFrame:frame imageArray:imageArray selectItemBlock:selectItemBlock];
    
    return wyPhotoView;
}

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSMutableArray *)imageArray selectItemBlock:(SelectItemBlock)selectItemBlock{
    self = [super initWithFrame:frame];
    if (self) {
        //参数赋值
        self.imageArray = imageArray;
        self.selectItemBlock = selectItemBlock;
        
        //布局
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
    self.layout = layout;
    
    UICollectionView *collectionView = ({
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor clearColor];
        //collectionView.center = self.center;
        collectionView.frame = self.bounds;
        collectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:collectionView];
        
        collectionView.dataSource = self;
        collectionView.delegate = self;

        collectionView;
    });
    self.collectionView = collectionView;
    
    //注册cell
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class])  bundle:nil] forCellWithReuseIdentifier:ID];
    
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    NSString *imageName = self.imageArray[indexPath.row];
    
    cell.image = [UIImage imageNamed:imageName];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    if (self.selectItemBlock) {
        self.selectItemBlock(indexPath);
    }
}


@end
