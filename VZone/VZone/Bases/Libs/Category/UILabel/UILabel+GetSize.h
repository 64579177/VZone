//
//  UILabel+GetSize.h
//  JYallHaoFangTong
//
//  Created by 葬花桥 on 15/12/3.
//  Copyright © 2015年 陈石. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (GetSize)
- (CGSize)getLabelSize:(CGFloat)maxWidth;


+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
@end
