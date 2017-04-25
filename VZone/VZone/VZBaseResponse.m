//
//  VZBaseResponse.m
//  VZone
//
//  Created by guo xiaowei on 2017/4/25.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import "VZBaseResponse.h"

@implementation VZBaseResponse

- (instancetype)initWithTask:(NSURLSessionDataTask *)task responseObject :(id)responseObject error :(NSError *) error{
    self = [super init];
    if (self) {
        self.url = task.originalRequest.URL.absoluteString;
        self.responseCode = [[task.response valueForKey:@"statusCode"] integerValue];
        self.responseObject = responseObject[@"data"];
        if (self.responseCode == 200) {
            self.isSuccess = YES;
            self.responseObjCode = [responseObject[@"code"] integerValue];
            self.responseObjMessage = responseObject[@"message"];
        }else{
            self.isSuccess = NO;
            int code;
            self.errorMessage = [self getErrorMessage:error code:&code];//error.errorMsg;
            self.responseCode = code;
            self.code = code;
            self.error = error;
        }
    }
    return self;
}

-(NSString *)getErrorMessage:(NSError *)error code:(int *)code {
    NSString *errorMessage = nil;
    for (id data in error.userInfo.allValues) {
        if ([data isKindOfClass:[NSData class]]) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            errorMessage = dic[@"message"];
            *code = [dic[@"code"] intValue];
        }
        if ([data isKindOfClass:[NSError class]]) {
            errorMessage = [self getErrorMessage:data code:code];
        }
    }
    
    if (errorMessage == nil || [errorMessage isKindOfClass:[NSNull class]]) {
        return @"请求失败";
    }
    return errorMessage;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\n******************httpCode - %ld\n ******************code - %li\n ******************errorMessage - %@\n ******************是否成功 - %d\n ******************URL - %@\n ******************responseObject - %@\n  ******************responseMessage - %@\n ******************错误描述 - %@\n",self.responseCode,self.code,self.errorMessage , self.isSuccess , self.url,self.responseObject,self.responseObjMessage,self.error];
}


@end
