//
//  UILabel+GetActiveLabel.m
//  VZone
//
//  Created by guo xiaowei on 2018/4/10.
//  Copyright © 2018年 guo xiaowei. All rights reserved.
//

#import "UILabel+GetActiveLabel.h"

@implementation UILabel (GetActiveLabel)


+(UILabel*)getLabel:(CGRect *)rect color:(UIColor *)color text:(NSString *)text ali:(NSTextAlignment *)ali fontSize:(CGFloat )fontSize{
    
    CGRect temRect = [text boundingRectWithSize:CGSizeMake(kScreenW-40, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0,0, temRect.size.width, temRect.size.height)];
    
    label.text = text;
    
    label.numberOfLines =0;
    
    return label;
}

@end
