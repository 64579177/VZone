//
//  VZMineApiManager.h
//  VZone
//
//  Created by guo xiaowei on 2017/4/25.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JYWIFISWITCH  @"JYWIFISWITCH"
#define JYPHOTOSWITCH  @"JYPHOTOSWITCH"
#define JYVIDEOSWITCH  @"JYVIDEOSWITCH"


typedef void(^Finished)(BOOL success,id response,NSString *message);

@interface VZMineApiManager : NSObject


/**
 用户登录接口
 
 @param userName 用户名
 @param passWord 密码
 @param finished (登录是否成功,服务器返回信息,登录信息)
 */
+ (void)executeLoginWithUserName:(NSString *)userName passWord:(NSString *)passWord Finished:(Finished)finished;

@end
