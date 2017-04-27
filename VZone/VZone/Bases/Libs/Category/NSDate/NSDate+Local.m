//
//  NSDate+Local.m
//  Showing
//
//  Created by 赵友源 on 15/4/25.
//  Copyright (c) 2015年 next-software. All rights reserved.
//

#import "NSDate+Local.h"

@implementation NSDate (Local)

- (NSDate *)dateChina
{
    NSDate     *date       = [NSDate date];
    NSTimeZone *zone       = [NSTimeZone systemTimeZone];
    NSInteger  interval    = [zone secondsFromGMTForDate:date];
    NSDate     *localeDate = [date dateByAddingTimeInterval:interval];
    return localeDate;
}

- (NSString *)datePassedDesc
{
    //    NSDate* dNowTime = [self dateChina];
    NSDate         *dNowTime    = [NSDate date];
    NSTimeInterval timeInterval = [self timeIntervalSinceDate:dNowTime];
    timeInterval = -timeInterval;
    long     temp = 0;
    NSString *result;
    if (timeInterval < 60)
    {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if ((temp = timeInterval / 60) < 60)
    {
        result = [NSString stringWithFormat:@"%ld分钟前", temp];
    }
    else if ((temp = temp / 60) < 24)
    {
        result = [NSString stringWithFormat:@"%ld小时前", temp];
    }
    else if ((temp = temp / 24) < 30)
    {
        result = [NSString stringWithFormat:@"%ld天前", temp];
    }
    else if ((temp = temp / 30) < 12)
    {
        result = [NSString stringWithFormat:@"%ld月前", temp];
    }
    else
    {
        temp   = temp / 12;
        result = [NSString stringWithFormat:@"%ld年前", temp];
    }
    return result;
}

- (NSString *)toDefaultDesc
{
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy-MM-dd HH:mm";
    return [formater stringFromDate:self];
}

- (NSString *)toShortDefaultDesc
{
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy-MM-dd";
    return [formater stringFromDate:self];
}

+ (NSDate *)dateFromJSONString:(NSString *)jsonDate
{
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSDate *tempDate = [formater dateFromString:jsonDate];
    //    NSTimeZone* zone = [NSTimeZone systemTimeZone];
    //    NSInteger interval = [zone secondsFromGMTForDate:tempDate];
    //    NSDate* returnDate = [tempDate dateByAddingTimeInterval:interval];
    //    return returnDate;
    return tempDate;
}

- (NSString *)toNormalString
{
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [formater stringFromDate:self];
}

@end
