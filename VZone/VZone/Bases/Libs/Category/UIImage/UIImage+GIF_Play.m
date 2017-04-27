//
//  UIImage+GIF_Play.m
//  JYHomeCloud
//
//  Created by 孟遥 on 16/12/16.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "UIImage+GIF_Play.h"
#import <objc/runtime.h>

static char imageViewKey;

@implementation UIImage (GIF_Play)

//准备GIF播放
+ (void)GIF_PrePlayWithImageView:(UIImageView *)imageView imageNamesArray:(NSArray *)array duration:(NSInteger)duration
{
    imageView.hidden = NO;
    NSMutableArray *arr = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(NSString  *_Nonnull imageName, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UIImage *image = [UIImage imageNamed:imageName];
        [arr addObject:image];
    }];
    //设置序列帧图像数组
    imageView.animationImages = arr;
    //设置动画时间
    imageView.animationDuration = 1;
    //设置播放次数，0代表无限次
    imageView.animationRepeatCount = (NSInteger)duration;
//    [imageView startAnimating];
    
    [imageView startAnimating];
    //赋值
//    objc_setAssociatedObject(self ,&imageViewKey ,imageView ,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//停止播放
+ (void)GIF_Stop:(UIImageView *)imageView
{
    [imageView stopAnimating];
}






@end
