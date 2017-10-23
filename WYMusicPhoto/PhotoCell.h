//
//  PhotoCell.h
//  仿网易云音乐相册滑动效果
//
//  Created by liulc on 16/8/24.
//  Copyright © 2016年 liulc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;

@property (nonatomic, strong) UIImage *image;


@end
