//
//  UILabel+GetSize.m
//  JYallHaoFangTong
//
//  Created by 葬花桥 on 15/12/3.
//  Copyright © 2015年 陈石. All rights reserved.
//

#import "UILabel+GetSize.h"

@implementation UILabel (GetSize)
- (CGSize)getLabelSize:(CGFloat)maxWidth
{
    // 动态调整label高度
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [self.text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    /*
     This method returns fractional sizes (in the size component of the returned CGRect); to use a returned size to size views, you must use raise its value to the nearest higher integer using the ceil function.
     */
    labelSize.height = ceil(labelSize.height);
    labelSize.width = ceil(labelSize.width);
    //    NSLog(@"%@", NSStringFromCGSize(labelSize));
    return labelSize;
}




+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}
@end
