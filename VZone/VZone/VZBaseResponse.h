//
//  VZBaseResponse.h
//  VZone
//
//  Created by guo xiaowei on 2017/4/25.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VZBaseResponse : NSObject


///返回的httpCode
@property (assign,nonatomic) NSInteger responseCode;  //网络连接code

@property (assign,nonatomic) NSInteger code; //服务器错误code
///返回的错误信息
@property (copy,nonatomic) NSString *errorMessage;
///是否成功
@property (assign) BOOL isSuccess;
@property(copy, nonatomic) NSString *url;//请求url

@property (nonatomic) id responseObject;

//responseObject 带code 和 message
@property (assign, nonatomic) NSInteger responseObjCode; //当前请求内容状态code
@property (copy, nonatomic) NSString *responseObjMessage;
@property (nonatomic,strong) NSError *error;


- (instancetype)initWithTask:(NSURLSessionDataTask *)task responseObject :(id)responseObject error :(NSError *) error;

@end
