//
//  UIBarButtonItem+WNXBarButtonItem.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/6/29.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WNXBarButtonItem)

/**
 *  根据图片快速创建一个UIBarButtonItem，返回小号barButtonItem
 */
+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target isLeftButton:(BOOL)isleft action:(SEL)action;

/**
 *根据图片快速创建一个UIBarButtonItem，返回大号barButtonItem
 */
+ (UIBarButtonItem *)initWithNormalImageBig:(NSString *)image target:(id)target action:(SEL)action;

/**
 *根据图片快速创建一个UIBarButtonItem，自定义大小
 */
+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height;
//创建有图片，有文字的
+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action  imageSize:(CGSize)imageSize margin:(CGFloat)margin;


/**
 *根据文字快速创建一个UIBarButtonItem，自定义大小
 */
+ (UIBarButtonItem *)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action size:(CGSize)size isLeft:(BOOL)isLeft;

@end
