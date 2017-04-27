//
//  VZBaseNetWorkApi.m
//  VZone
//
//  Created by guo xiaowei on 2017/4/25.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import "VZBaseNetWorkApi.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "AFHTTPSessionManager.h"
#import "VZMineApiManager.h"

@interface VZBaseNetWorkApi ()

@property (nonatomic,strong)AFHTTPSessionManager *manager;

@end

static VZBaseNetWorkApi *baseNetWorkApi;
@implementation VZBaseNetWorkApi

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseNetWorkApi = [[VZBaseNetWorkApi alloc]init];
    });
    return baseNetWorkApi;
}

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
        sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        sessionManager.responseSerializer = responseSerializer;
        [sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        sessionManager.requestSerializer.timeoutInterval = 30.f;
        [sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                                         @"text/html",
                                                                                         @"text/json",
                                                                                         @"text/plain",
                                                                                         @"text/javascript",
                                                                                         @"text/xml",
                                                                                         @"image/*",
                                                                                         @"application/x-www-form-urlencoded"]];
        sessionManager.operationQueue.maxConcurrentOperationCount = 3;
        /*
         NSURL * url = [NSURL URLWithString:@"https://www.google.com"];
         AFHTTPRequestOperationManager * requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
         dispatch_queue_t requestQueue = dispatch_create_serial_queue_for_name("kRequestCompletionQueue");
         requestOperationManager.completionQueue = requestQueue;
         
         AFSecurityPolicy * securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
         
         //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
         //如果是需要验证自建证书，需要设置为YES
         securityPolicy.allowInvalidCertificates = YES;
         
         //validatesDomainName 是否需要验证域名，默认为YES；
         //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
         //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
         //如置为NO，建议自己添加对应域名的校验逻辑。
         securityPolicy.validatesDomainName = YES;
         
         //validatesCertificateChain 是否验证整个证书链，默认为YES
         //设置为YES，会将服务器返回的Trust Object上的证书链与本地导入的证书进行对比，这就意味着，假如你的证书链是这样的：
         //GeoTrust Global CA
         //    Google Internet Authority G2
         //        *.google.com
         //那么，除了导入*.google.com之外，还需要导入证书链上所有的CA证书（GeoTrust Global CA, Google Internet Authority G2）；
         //如是自建证书的时候，可以设置为YES，增强安全性；假如是信任的CA所签发的证书，则建议关闭该验证，因为整个证书链一一比对是完全没有必要（请查看源代码）；
         securityPolicy.validatesCertificateChain = NO;
         
         requestOperationManager.securityPolicy = securityPolicy;*/
        /**********************************************/
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        securityPolicy.allowInvalidCertificates = NO;
        securityPolicy.validatesDomainName = YES;
        sessionManager.securityPolicy = securityPolicy;
        /**********************************************/
        _manager = sessionManager;
        
        
    }
    //[self setHtttpCommonHeader:_manager];
    return _manager;
}

/**
//版本强制升级需要在header中加入version(版本)，deviceType（设备类型:iOS,android），加入accessToken（令牌）,signature（签名）备用，这两个字段都使用登录后的tokenId
- (void)setHtttpCommonHeader:(AFHTTPSessionManager *)manager{
    
    [manager.requestSerializer setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forHTTPHeaderField:@"version"];
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"deviceType"];
    if ([JYAccountTool account].tokenId.length > 0) {
        [manager.requestSerializer setValue:[JYAccountTool account].userName forHTTPHeaderField:@"userName"];
        [manager.requestSerializer setValue:[JYAccountTool account].tokenId forHTTPHeaderField:@"accessToken"];
        [manager.requestSerializer setValue:[JYAccountTool account].tokenId forHTTPHeaderField:@"signature"];
        [manager.requestSerializer setValue:JYVersionCode forHTTPHeaderField:@"versionCode"];
    }
}
 
 */

+ (void)configureHttpHeaderWithDict:(NSDictionary *)dict
{
    AFHTTPSessionManager *manager = [VZBaseNetWorkApi sharedInstance].manager;
    NSArray *allKeyArray = dict.allKeys;
    for (int i = 0; i < [allKeyArray count]; i ++) {
        if (dict[allKeyArray[i]]) {
            [manager.requestSerializer setValue:dict[allKeyArray[i]] forHTTPHeaderField:allKeyArray[i]];
        }
    }
}


+ (void)getFromURL:(NSString *)URLString
            params:(NSDictionary *)params
          finished:(VZApiCallBack)finished
{
    
    
    
    
    AFHTTPSessionManager *manager = [VZBaseNetWorkApi sharedInstance].manager;
    
    NSLog(@"---->%@",manager.requestSerializer.HTTPRequestHeaders);
    
    [manager GET:URLString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        responseObject = [self replaceNullsWithBlanksWithResponseObject:responseObject];
        VZBaseResponse *apiObject = [[VZBaseResponse alloc]initWithTask:task responseObject:responseObject error:nil];
        finished(apiObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        VZBaseResponse *apiObject = [[VZBaseResponse alloc]initWithTask:task responseObject:nil error:error];
        if ([VZBaseNetWorkApi sharedInstance].isHasNet == YES) {
            apiObject.errorMessage = @"网络连接不可用，请检查您的网络";
        }
        finished(apiObject);
    }];
}

+ (void)postToURL:(NSString *)URLString
       bodyParams:(id)bodyParams
         finished:(VZApiCallBack)finished
{
    AFHTTPSessionManager *manager = [VZBaseNetWorkApi sharedInstance].manager;
    
    [manager POST:URLString parameters:bodyParams progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //responseObject = [self replaceNullsWithBlanksWithResponseObject:responseObject];
        
        VZBaseResponse *apiObject = [[VZBaseResponse alloc]initWithTask:task responseObject:responseObject error:nil];
        if (apiObject.responseObjCode == -10001) {
            //[VZMineApiManager userQuit:apiObject.responseObjMessage];
        }else if (apiObject.responseObjCode == -10000){
            //[Tool hideLodingOnWindow];
            
            //JYUpDateView *upDateView = [[JYUpDateView alloc]initWithFrame:CGRectMake(0, 0, JYScreen_Width, JYScreen_Height)];
           // [[UIApplication sharedApplication].keyWindow addSubview:upDateView];
        }else{
            finished(apiObject);
        }
        NSLog(@"-----------------------R %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        VZBaseResponse *apiObject = [[VZBaseResponse alloc]initWithTask:task responseObject:nil error:error];
        if ([VZBaseNetWorkApi sharedInstance].isHasNet == YES) {
            apiObject.errorMessage = @"网络连接不可用，请检查您的网络";
        }
        finished(apiObject);
    }];

}


#pragma  mark -   ----------带进度回调的POST请求
+ (void)postToURL_progress:(VZApiProgressCallBack)progress urlString:(NSString *)URLString
                bodyParams:(id)bodyParams
                  finished:(VZApiCallBack)finished
{
    AFHTTPSessionManager *manager = [VZBaseNetWorkApi sharedInstance].manager;
    
    [manager POST:URLString parameters:bodyParams progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress) {
            CGFloat postProGress = (CGFloat)(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
            progress(postProGress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        responseObject = [self replaceNullsWithBlanksWithResponseObject:responseObject];
        
        VZBaseResponse *apiObject = [[VZBaseResponse alloc]initWithTask:task responseObject:responseObject error:nil];
        finished(apiObject);
        NSLog(@"-----------------------R %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        VZBaseResponse *apiObject = [[VZBaseResponse alloc]initWithTask:task responseObject:nil error:error];
        if ([VZBaseNetWorkApi sharedInstance].isHasNet == YES) {
            apiObject.errorMessage = @"网络连接不可用，请检查您的网络";
        }
        finished(apiObject);
    }];
}





+ (void)putToURL:(NSString *)URLString
          params:(NSDictionary *)params
        finished:(VZApiCallBack)finished
{
    AFHTTPSessionManager *manager = [VZBaseNetWorkApi sharedInstance].manager;
    [manager PUT:URLString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        responseObject = [self replaceNullsWithBlanksWithResponseObject:responseObject];
        
        VZBaseResponse *apiObject = [[VZBaseResponse alloc]initWithTask:task responseObject:responseObject error:nil];
        finished(apiObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        VZBaseResponse *apiObject = [[VZBaseResponse alloc]initWithTask:task responseObject:nil error:error];
        if ([VZBaseNetWorkApi sharedInstance].isHasNet == YES) {
            apiObject.errorMessage = @"网络连接不可用，请检查您的网络";
        }
        finished(apiObject);
    }];
}

+ (void)deleteFromURL:(NSString *)URLString
               params:(NSDictionary *)params
             finished:(VZApiCallBack)finished
{
    AFHTTPSessionManager *manager = [VZBaseNetWorkApi sharedInstance].manager;
    [manager DELETE:URLString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        responseObject = [self replaceNullsWithBlanksWithResponseObject:responseObject];
        
        VZBaseResponse *apiObject = [[VZBaseResponse alloc]initWithTask:task responseObject:responseObject error:nil];
        finished(apiObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        VZBaseResponse *apiObject = [[VZBaseResponse alloc]initWithTask:task responseObject:nil error:error];
        if ([VZBaseNetWorkApi sharedInstance].isHasNet == YES) {
            apiObject.errorMessage = @"网络连接不可用，请检查您的网络";
        }
        finished(apiObject);
    }];
}
- (void)cancelAllOperations {
    AFHTTPSessionManager *manager = [VZBaseNetWorkApi sharedInstance].manager;
    [manager.operationQueue cancelAllOperations];
}


@end
