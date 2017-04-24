//
//  config.h
//  VZone
//
//  Created by guo xiaowei on 2017/3/27.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#ifndef config_h
#define config_h


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
