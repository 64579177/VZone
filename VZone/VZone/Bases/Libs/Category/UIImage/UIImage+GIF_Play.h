//
//  UIImage+GIF_Play.h
//  JYHomeCloud
//
//  Created by 孟遥 on 16/12/16.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GIF_Play)


//GIF自动播放
+ (void)GIF_PrePlayWithImageView:(UIImageView *)imageView imageNamesArray:(NSArray *)array duration:(NSInteger)duration;

//GIF停止播放
+ (void)GIF_Stop:(UIImageView *)imageView;

@end
