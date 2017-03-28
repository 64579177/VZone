//
//  VZAccount.m
//  VZone
//
//  Created by guo xiaowei on 2017/3/27.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import "VZAccount.h"

static VZAccount *account =   nil;

@implementation VZAccount

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        account = [[VZAccount alloc]init];
    });
    return account;
}

//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super init]) {
//        unsigned int count = 0;
//        //获取类中所有成员变量名
//        Ivar *ivar = class_copyIvarList([VZAccount class], &count);
//        for (NSInteger index = 0; index<count; index++) {
//            Ivar iva = ivar[index];
//            const char *name = ivar_getName(iva);
//            NSString *strName = [NSString stringWithUTF8String:name];
//            id value = [decoder decodeObjectForKey:strName];
//            [self setValue:value forKey:strName];
//        }
//        free(ivar);
//    }
//    return self;
//}
//
///**
// *  将对象写入文件的时候调用
// *  在这个方法中写清除：要存储哪些对象的哪些属性，以及怎样存储属性
// */
//- (void)encodeWithCoder:(NSCoder *)encoder
//{
//    unsigned int count;
//    Ivar *ivar = class_copyIvarList([VZAccount class], &count);
//    for (NSInteger index = 0; index <count; index++) {
//        Ivar iv = ivar[index];
//        const char *name = ivar_getName(iv);
//        NSString *strName = [NSString stringWithUTF8String:name];
//        
//        id value = [self valueForKey:strName];
//        [encoder encodeObject:value forKey:strName];
//    }
//    free(ivar);
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
