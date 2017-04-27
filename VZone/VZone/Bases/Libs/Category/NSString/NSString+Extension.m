//
//  NSString+Extension.m

//
//  Created by xc on 15/3/6.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
#pragma mark 计算字符串大小
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize textSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return textSize;
}

+ (CGSize)stringSizeWithWordContainer:(UIView *)container maxSize:(CGSize)maxSize
{
    if (!container) {
        return CGSizeZero;
    }
    CGSize needSize = [container sizeThatFits:maxSize];
    
    return needSize;
}




- (NSString *)URLEncodedString{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                            NULL,
                                            kCFStringEncodingUTF8));
    return encodedString;
}

-(NSString *)dateStringWithDateFormat:(NSString *)dateFormat{

    NSString *dateFormatString = (dateFormat)?(dateFormat):@"yyyy-MM-dd HH:mm";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]/1000.0];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = dateFormatString;
    return [format stringFromDate:date];
    
}

+ (BOOL) validateCutomerName:(NSString *)name length:(NSUInteger)length{
    if (name.length == 0) {
        return NO;
    }
    NSString * regexString = [NSString stringWithFormat:@"^[%@]{0,%lu}$",@"[\u4e00-\u9fa5]", (unsigned long)length];
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexString];
    BOOL b = [userNamePredicate evaluateWithObject:name];
    return b;
    
}
@end
