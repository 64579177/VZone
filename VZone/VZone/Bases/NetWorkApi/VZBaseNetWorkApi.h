//
//  VZBaseNetWorkApi.h
//  VZone
//
//  Created by guo xiaowei on 2017/4/25.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VZBaseResponse.h"

typedef void(^VZApiCallBack)(VZBaseResponse * apiResponse);

//带进度的回调
typedef void (^VZApiProgressCallBack)(CGFloat progress);

@interface VZBaseNetWorkApi : NSObject


@property (nonatomic,assign)BOOL isHasNet;//YES没网，NO有网


+ (instancetype)sharedInstance;


+ (void)configureHttpHeaderWithDict:(NSDictionary *)dict;

/**
 *  get 方法
 *
 *  @param URLString 请求 url
 *  @param params    参数
 *  @param finished  返回结果回调
 */
+ (void)getFromURL:(NSString *)URLString
            params:(NSDictionary *)params
          finished:(VZApiCallBack)finished;


/**
 *  post 请求
 *
 *  @param URLString  请求url
 *  @param bodyParams body体参数
 *  @param finished   返回结果回调
 */
+ (void)postToURL:(NSString *)URLString
       bodyParams:(id)bodyParams
         finished:(VZApiCallBack)finished;



/**
 POST  带进度回调
 
 @param progress   进度
 @param URLString  url
 @param bodyParams 参数
 @param finished   完成
 */
+ (void)postToURL_progress:(VZApiProgressCallBack)progress urlString:(NSString *)URLString
                bodyParams:(id)bodyParams
                  finished:(VZApiCallBack)finished;

/**
 *  put
 *
 *  @param URLString 请求url
 *  @param params    参数
 *  @param finished  返回结果回调
 */
+ (void)putToURL:(NSString *)URLString
          params:(NSDictionary *)params
        finished:(VZApiCallBack)finished;
/**
 *  删除 delete
 *
 *  @param URLString 请求url
 *  @param params    参数
 *  @param finished  返回结果回调
 */
+ (void)deleteFromURL:(NSString *)URLString
               params:(NSDictionary *)params
             finished:(VZApiCallBack)finished;
/**
 *  取消去全部
 */
- (void)cancelAllOperations;


@end
