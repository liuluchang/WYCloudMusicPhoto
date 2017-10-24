# WYCloudMusicPhoto V1.1.0
中文介绍

仿网易云音乐滑动卡片

![演示动态图] (https://github.com/liuluchang/HandWriteDemo/blob/master/1111.gif)

1、基本使用

一句话调用


 WYPhotoView *wyPhotoView = [WYPhotoView initWithFrame:frame imageArray:imageArray selectItemBlock:^(NSIndexPath *indexPath) {
       //回调
   }];

2、安装

CocoaPods

在 Podfile 中添加   

pod 'WYCloudMusicPhoto', '~> 1.1.0'

执行 pod install

导入 #import "WYPhotoView.h"

许可证

WYCloudMusicPhoto 使用 MIT 许可证，详情见 LICENSE 文件。
