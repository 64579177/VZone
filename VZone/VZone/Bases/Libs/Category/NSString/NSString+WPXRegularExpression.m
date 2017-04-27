//
//  NSString+WPXRegularExpression.m
//  JinSeJiaYuanWang
//
//  Created by 葬花桥 on 16/4/13.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "NSString+WPXRegularExpression.h"

@implementation NSString (WPXRegularExpression)
- (BOOL)isNumbers
{
    BOOL isNumbers = YES;
    NSRange pointRange = [self rangeOfString:@"."];
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:@"[^\\d]+" options:0 error:nil];
    if (pointRange.location != NSNotFound) { // 找到.符号 可能为小数
        NSString *leftString = [self substringWithRange:NSMakeRange(0, pointRange.location)];
        NSString *rightString = [self substringWithRange:NSMakeRange(pointRange.location + 1, self.length - 1 - leftString.length)];
        BOOL leftIsNumbers = ![reg firstMatchInString:leftString options:0 range:NSMakeRange(0, leftString.length)];
        BOOL rightIsNumbers = ![reg firstMatchInString:rightString options:0 range:NSMakeRange(0, rightString.length)];;
        isNumbers = leftIsNumbers && rightIsNumbers;
    } else {
        isNumbers = ![reg firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    }
    
    return isNumbers;
}

- (BOOL)isSmallNumbersMaxBits:(NSInteger)bits
{
    BOOL isNumbers = [self isNumbers];
    
    if (!isNumbers) {
        return NO;
    }
    
    NSRange pointRange = [self rangeOfString:@"."];
    if (pointRange.location == NSNotFound) {
        return NO;
    }
    
    if (self.length - pointRange.location <= bits+1) {
        return YES;
    }
    return NO;
}

- (BOOL)isName
{
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:@"[➑➋➌➍➎➏➐➒a-zA-Z\u4e00-\u9fa5]|[➑➋➌➍➎➏➐➒a-zA-Z0-9\u4e00-\u9fa5]+" options:0 error:nil];
    return [reg firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
}

@end
