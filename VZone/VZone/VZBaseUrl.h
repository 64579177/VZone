//
//  VZBaseUrl.h
//  VZone
//
//  Created by guo xiaowei on 2017/4/25.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#ifndef VZBaseUrl_h
#define VZBaseUrl_h


/**
 登陆接口
 
 @return 返回登陆接口url
 */
NS_INLINE NSString * VZ_Mine_UserLogin () {
    NSString *tmpString = @"http://t.yanchengqu.com/interface/user/Login.api?";
    return tmpString;
}

#endif /* VZBaseUrl_h */
