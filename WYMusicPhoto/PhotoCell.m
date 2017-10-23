//
//  PhotoCell.m
//  仿网易云音乐相册滑动效果
//
//  Created by liulc on 16/8/24.
//  Copyright © 2016年 liulc. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        _photoImageView.image = _image;
    }
    
    return self;
}

-(void)setImage:(UIImage *)image{
    _photoImageView.image = image;
}

@end
