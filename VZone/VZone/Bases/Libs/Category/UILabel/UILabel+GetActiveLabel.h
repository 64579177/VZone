//
//  UILabel+GetActiveLabel.h
//  VZone
//
//  Created by guo xiaowei on 2018/4/10.
//  Copyright © 2018年 guo xiaowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (GetActiveLabel)
+(UILabel*)getLabel : (CGRect *)rect color:(UIColor*)color text:(NSString*)text ali:(NSTextAlignment*)ali fontSize:(CGFloat)fontSize;
@end
