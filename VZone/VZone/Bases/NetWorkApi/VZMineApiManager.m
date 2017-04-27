//
//  VZMineApiManager.m
//  VZone
//
//  Created by guo xiaowei on 2017/4/25.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import "VZMineApiManager.h"
#import "VZBaseUrl.h"
#import "VZBaseNetWorkApi.h"
@implementation VZMineApiManager


//登录接口
+ (void)executeLoginWithUserName:(NSString *)userName passWord:(NSString *)passWord Finished:(void(^)(BOOL success,id response,NSString *message))finished
{
    NSString *loginApi =  VZ_Mine_UserLogin();
    NSDictionary *dataDict = @{@"loginName":userName,
                               @"passWord":passWord};
    [VZBaseNetWorkApi postToURL:loginApi bodyParams:dataDict finished:^(VZBaseResponse *apiResponse) {
        
        if (apiResponse.isSuccess) {
            if (apiResponse.responseObjCode == 100) {
                finished(YES,apiResponse.responseObject,nil);
            }else if (apiResponse.responseObjCode == -9999){
                finished(NO,apiResponse.responseObject,@"登录失败");
            }else{
                finished(NO,apiResponse.responseObject,apiResponse.responseObjMessage);
            }
        }else{
            finished(NO,nil,@"网络异常");
        }
    }];
}


@end
