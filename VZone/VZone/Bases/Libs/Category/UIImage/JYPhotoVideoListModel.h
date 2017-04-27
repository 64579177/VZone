//
//  JYPhotoVideoListModel.h
//  JYHomeCloud
//
//  Created by 孟遥 on 16/12/19.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JYPhotoVideoListModel : NSObject


@end




@interface JYPhotoVideoModel : NSObject

/**
 原图
 */
@property (nonatomic, strong) UIImage *orignalImage;

/**
  原图data
 */
@property (nonatomic, strong) NSData *orignalData;

/**
 普通data
 */
@property (nonatomic, strong) NSData *normalData;

/**
  普通压缩图片
 */
@property (nonatomic, strong) UIImage *normalImage;


/**
 视频资源
 */
@property (nonatomic, strong) NSData *videoData;


/**
 资源名称
 */
@property (nonatomic, copy) NSString *fileName;


/**
 大小
 */
@property (nonatomic, assign) long long int size;


/**
  是否为原图
 */
@property (nonatomic, assign) BOOL isOrignal;

@end
