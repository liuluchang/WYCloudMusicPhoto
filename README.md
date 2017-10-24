# WYCloudMusicPhoto
中文介绍

仿网易云音乐滑动卡片

基本使用

一句话调用


  CGRect frame = CGRectMake(0, (self.view.center.y-200)/2, ScreenW, 200);
  WYPhotoView *wyPhotoView = [[WYPhotoView alloc] initWithFrame:frame];

安装

CocoaPods

在 Podfile 中添加   
pod 'WYCloudMusicPhoto', '~> 1.0.0'
执行 pod install。
导入 #import "WYPhotoView.h"


许可证

WYCloudMusicPhoto 使用 MIT 许可证，详情见 LICENSE 文件。
