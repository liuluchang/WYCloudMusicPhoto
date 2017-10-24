//
//  FlowLayout.m
//  仿网易云音乐相册滑动效果
//
//  Created by liulc on 16/8/25.
//  Copyright © 2016年 liulc. All rights reserved.
//

#import "FlowLayout.h"

@implementation FlowLayout

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

-(void)prepareLayout{
    [super prepareLayout];
}

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
    
    CGFloat collectionW = self.collectionView.bounds.size.width;
    
    CGPoint targetP = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    
    CGRect targetRect = CGRectMake(targetP.x, 0, collectionW, MAXFLOAT);
    
    NSArray *attrs = [super layoutAttributesForElementsInRect:targetRect];
    
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        CGFloat delta = (attr.center.x - targetP.x) - self.collectionView.bounds.size.width * 0.5;
        if (fabs(delta) < fabs(minDelta)) {
            minDelta = delta;
        }
    }
    
    targetP.x += minDelta;
    
    if (targetP.x < 0) {
        targetP.x = 0;
    }
    
    return targetP;
}

@end
