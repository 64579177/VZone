//
//  UIBarButtonItem+WNXBarButtonItem.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/6/29.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "UIBarButtonItem+WNXBarButtonItem.h"


#pragma  mark - 自定义button
@interface MYButton :UIButton

@property (nonatomic, assign) CGSize imageSize;
@property (nonatomic, assign) CGFloat margin;
@end

@implementation MYButton
// margin:(CGFloat)margin imageSize:(CGSize)imageSize titleSize:(CGSize)titleSize

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

//50  24
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.imageSize.width, self.imageSize.height);
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + self.margin, 0, CGRectGetWidth(self.frame)-self.imageSize.width - self.margin, self.imageSize.height);
}


@end




@implementation UIBarButtonItem (WNXBarButtonItem)

+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target isLeftButton:(BOOL)isleft action:(SEL)action
{
    UIImage *normalImage = [UIImage imageNamed:image];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 24, 24);
    btn.imageView.contentMode = UIViewContentModeCenter;
//        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
//    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action  imageSize:(CGSize)imageSize margin:(CGFloat)margin
{
    UIImage *normalImage = [UIImage imageNamed:image];
    
    MYButton *btn = [MYButton buttonWithType:UIButtonTypeCustom];
    CGSize size = [title boundingRectWithSize:CGSizeMake(100,25) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]} context:nil].size;
    btn.frame = CGRectMake(0, 0, size.width + margin + imageSize.width,imageSize.height);
    [btn setValue:[NSValue valueWithCGSize:imageSize] forKey:@"imageSize"];
    [btn setValue:@(margin) forUndefinedKey:@"margin"];
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = JYFontSet(14.f);
    [btn setTitleColor:MainWhiteColor forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)initWithNormalImageBig:(NSString *)image target:(id)target action:(SEL)action
{
    UIImage *normalImage = [UIImage imageNamed:image];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 35, 35);
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height
{
    UIImage *normalImage = [UIImage imageNamed:image];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, width, height);
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action size:(CGSize)size isLeft:(BOOL)isLeft
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, size.width, size.height);
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    if (isLeft == YES) {
       btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    }else{
       btn.titleLabel.textAlignment = NSTextAlignmentRight;
    }
   
    [btn setTitle:title forState:UIControlStateNormal];
    if (!titleColor) {
        titleColor = UICOLOR_RGB_Alpha(0x333333, 1);
    }
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:UICOLOR_RGB_Alpha(0xffffff, 0.4) forState:UIControlStateDisabled];
    [btn setTitleColor:UICOLOR_RGB_Alpha(0xffffff, 0.4) forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}




@end
