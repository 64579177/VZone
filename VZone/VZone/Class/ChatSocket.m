//
//  ChatSocket.m
//  VZone
//
//  Created by guo xiaowei on 2017/9/20.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import "ChatSocket.h"
#import "GCDAsyncSocket.h"//TCP长连接

@interface ChatSocket()<GCDAsyncSocketDelegate>

//申明一个socket的成员变量
@property (nonatomic,strong) GCDAsyncSocket *socket;

@end


@implementation ChatSocket

+ (ChatSocket *)sharedInstance{
    static ChatSocket *sharedInstace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstace = [[self alloc] init];
    });
    return sharedInstace;
}

//socket连接
-(void)connetSocket{

    [_socket connectToHost:@"182.92.77.101" onPort:8888 withTimeout:30  error:nil];
    
}


// 连接成功回调
#pragma mark  - 连接成功回调
-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{

    NSLog(@"socket连接成功");
    self.connectTimer = [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(longConnectToSocket) userInfo:nil repeats:YES];
    [self.connectTimer fire];
 
}

// 心跳连接
- (void)longConnectToSocket{
    // 根据服务器要求发送固定格式的数据，假设为指令@"longConnect"，但是一般不会是这么简单的指令
    NSString *longConnect = @"longConnect";
    NSData *dataStream = [longConnect dataUsingEncoding:NSUTF8StringEncoding];
    [_socket writeData:dataStream withTimeout:1 tag:1];
}



@end
