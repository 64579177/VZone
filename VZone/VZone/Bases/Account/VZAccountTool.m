//
//  VZAccountTool.m
//  VZone
//
//  Created by guo xiaowei on 2017/4/27.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//


//这里是存用户的信息；
#define SWAccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.arch"]


#import "VZAccountTool.h"

@implementation VZAccountTool

+ (void)save:(VZAccount *)account
{
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:SWAccountFilepath];
}

+ (VZAccount *)account
{
    // 读取帐号
    VZAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:SWAccountFilepath];
    
    
    return account;
}


@end
