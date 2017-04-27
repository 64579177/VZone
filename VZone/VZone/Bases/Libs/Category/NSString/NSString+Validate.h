//
//  NSString+Validate.h
//  JYHomeCloud
//
//  Created by yuanyaning on 2016/11/24.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)

/*邮箱验证 MODIFIED BY HELENSONG*/
+ (BOOL)isValidateEmail:(NSString *)email;

/*手机号码验证 MODIFIED BY HELENSONG*/
+ (BOOL) isValidateMobile:(NSString *)mobile;

//密码验证: 只能是字母或者数字
+ (BOOL) isNumOrChar:(NSString *)pwd;

//是否为空字符串
+ (BOOL) isBlankString:(NSString *)str;

@end
