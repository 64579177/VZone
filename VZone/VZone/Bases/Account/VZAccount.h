//
//  VZAccount.h
//  VZone
//
//  Created by guo xiaowei on 2017/3/27.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <extobjc.h>

@interface VZAccount : NSObject<NSCoding>

@property (nonatomic , copy) NSString *userName;      
@property (nonatomic , copy) NSString * password;

@end
