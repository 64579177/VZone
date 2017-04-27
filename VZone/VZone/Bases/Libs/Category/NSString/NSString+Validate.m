//
//  NSString+Validate.m
//  JYHomeCloud
//
//  Created by yuanyaning on 2016/11/24.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)

/*邮箱验证 MODIFIED BY HELENSONG*/
+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/*手机号码验证 MODIFIED BY HELENSONG*/
+ (BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13-19开头，八个 \d 数字字符
    NSString *phoneRegex = @"^1+[3546789]+\\d{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}

//密码验证: 只能是字母或者数字
+ (BOOL) isNumOrChar:(NSString *)pwd
{
    NSString *pwdRegex = @"[A-Z0-9a-z]{0,26}";
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pwdRegex];
    return [pwdTest evaluateWithObject:pwd];
}

//是否为空字符串
+ (BOOL) isBlankString:(NSString *)str
{
    if (str == nil || str == NULL) {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

@end
