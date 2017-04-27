//
//  NSString+WPXRegularExpression.h
//  JinSeJiaYuanWang
//
//  Created by 葬花桥 on 16/4/13.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WPXRegularExpression)
/**
 *  判断字符串是不是整数或者小数
 *
 *  @return 结果
 */
- (BOOL)isNumbers;

/**
 *  判断字符串是不是小数
 *
 *  @param bits 小数最大允许位数
 *
 *  @return 结果
 */
- (BOOL)isSmallNumbersMaxBits:(NSInteger)bits;

@end
