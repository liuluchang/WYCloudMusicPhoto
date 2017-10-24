//
//  WYPhotoView.h
//  WYCloudMusicPhoto
//
//  Created by 刘禄昌 on 2017/10/23.
//  Copyright © 2017年 llc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlowLayout.h"
#import "PhotoCell.h"

typedef void(^SelectItemBlock)(NSIndexPath *indexPath);

@interface WYPhotoView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>

/** 图片缓存 */
@property (nonatomic, strong)NSMutableArray *imageArray;

/** 布局 */
@property (nonatomic, strong) FlowLayout *layout;

/** UICollectionView */
@property (nonatomic, strong) UICollectionView *collectionView;

/** 点击回调 */
@property (nonatomic, copy) SelectItemBlock selectItemBlock;

/** 初始化类方法 */
+ (instancetype)initWithFrame:(CGRect)frame imageArray:(NSMutableArray *)imageArray selectItemBlock:(SelectItemBlock)selectItemBlock;
@end
