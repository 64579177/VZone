//
//  NSDate+Local.h
//  Showing
//
//  Created by 赵友源 on 15/4/25.
//  Copyright (c) 2015年 next-software. All rights reserved.
//

@import Foundation;

@interface NSDate (Local)

- (NSDate *)dateChina;

- (NSString *)datePassedDesc;

- (NSString *)toShortDefaultDesc;

- (NSString *)toDefaultDesc;

+ (NSDate *)dateFromJSONString:(NSString *)jsonDate;

- (NSString *)toNormalString;

@end
