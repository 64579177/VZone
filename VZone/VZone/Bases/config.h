//
//  config.h
//  VZone
//
//  Created by guo xiaowei on 2017/3/27.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#ifndef config_h
#define config_h


#define JYFontSet(fontSize)  [UIFont systemFontOfSize:fontSize]
//16进制颜色
#define UICOLOR_RGB_Alpha(_color,_alpha) [UIColor colorWithRed:((_color>>16)&0xff)/255.0f green:((_color>>8)&0xff)/255.0f blue:(_color&0xff)/255.0f alpha:_alpha]
// 颜色
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

//主要金色
#define  MainGoldenColor  UICOLOR_RGB_Alpha(0xff9e2b,1)
//主要白色
#define  MainWhiteColor   UICOLOR_RGB_Alpha(0xFFFFFF, 1)
//基本背景色
#define  BaseBackColor    UICOLOR_RGB_Alpha(0xf0f0f0,1)
//分割线
#define  LineColor        UICOLOR_RGB_Alpha(0xe6e6e6,1)
//提示文字
#define  TipsColor        UICOLOR_RGB_Alpha(0x999999,1)
//主要文字颜色
#define  MainTextColor    UICOLOR_RGB_Alpha(0x333333,1)

#define kThemeColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]
//iphone6屏幕比例
#define VZWidth_Scale    [UIScreen mainScreen].bounds.size.width/375.0f
#define VZHeight_Scale  [UIScreen mainScreen].bounds.size.height/667.0f

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define VLoadImg(imageName) [UIImage imageNamed:imageName];
/// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]
#endif /* config_h */
