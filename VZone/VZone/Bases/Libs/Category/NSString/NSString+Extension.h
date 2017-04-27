
#import <UIKit/UIKit.h>

@interface NSString (Extension)


- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;


+ (CGSize)stringSizeWithWordContainer:(UIView *)container maxSize:(CGSize)maxSize;

//请求的时候给特殊字符转码
- (NSString *)URLEncodedString;

-(NSString *)dateStringWithDateFormat:(NSString *)dateFormat;


+ (BOOL) validateCutomerName:(NSString *)name length:(NSUInteger)length;

@end
