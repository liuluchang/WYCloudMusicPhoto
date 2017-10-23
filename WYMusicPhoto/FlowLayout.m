//
//  FlowLayout.m
//  仿网易云音乐相册滑动效果
//
//  Created by liulc on 16/8/25.
//  Copyright © 2016年 liulc. All rights reserved.
//

#import "FlowLayout.h"

@implementation FlowLayout

// Invalidate:刷新
// 在滚动的时候是否允许刷新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

// 什么时候调用:collectionView第一次布局,collectionView刷新的时候也会调用
// 作用:计算cell的布局,条件:cell的位置是固定不变
-(void)prepareLayout{
    [super prepareLayout];
}

// 作用:指定一段区域给你这段区域内cell的尺寸
// 可以一次性返回所有cell尺寸,也可以每隔一个距离返回cell
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSArray *attrs = [super layoutAttributesForElementsInRect:self.collectionView.bounds];
    
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        
        CGFloat delta = fabs((attr.center.x - self.collectionView.contentOffset.x)-self.collectionView.bounds.size.width/2);
        
        CGFloat scale = 1 - delta/(self.collectionView.bounds.size.width*0.5)*0.2;
        
        attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return attrs;
}

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    // 拖动比较快 最终偏移量 不等于 手指离开时偏移量
    CGFloat collectionW = self.collectionView.bounds.size.width;
    
    // 最终偏移量
    CGPoint targetP = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    //NSLog(@"targetP-> %f",targetP.x);
    
    // 0.获取最终显示的区域
    CGRect targetRect = CGRectMake(targetP.x, 0, collectionW, MAXFLOAT);
     //NSLog(@"targetRect-> %@",NSStringFromCGRect(targetRect));
    
    // 1.获取最终显示的cell
    NSArray *attrs = [super layoutAttributesForElementsInRect:targetRect];
    
    // 获取最小间距
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        // 获取距离中心点距离:注意:应该用最终的x
        CGFloat delta = (attr.center.x - targetP.x) - self.collectionView.bounds.size.width * 0.5;
        //NSLog(@"delta-> %f",delta);
        if (fabs(delta) < fabs(minDelta)) {
            minDelta = delta;
        }
    }
    
    // 移动间距
    targetP.x += minDelta;
    
    if (targetP.x < 0) {
        targetP.x = 0;
    }
    
    return targetP;
}

@end
