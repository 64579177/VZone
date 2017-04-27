//
//  NSDate+extension.h
//  JYHomeCloud
//
//  Created by 孟遥 on 16/12/15.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  JYChatMessageModel;

@interface NSDate (extension)

//判断时间戳是否为当天,昨天,一周内,年月日
+ (NSString *)timeStringWithTimeInterval:(NSString *)timeInterval;
+ (NSString *)timeStringWithTimeInterval11:(NSString *)timeInterval;//朋友圈
@end
