//
//  VZAccountTool.h
//  VZone
//
//  Created by guo xiaowei on 2017/4/27.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VZAccount.h"


@interface VZAccountTool : NSObject
@property (copy,nonatomic) NSString *UserDefaultUkey;

/**
 *  存储帐号
 */
+ (void)save:(VZAccount *)account;

/**
 *  读取帐号
 */
+ (VZAccount *)account;
@end
