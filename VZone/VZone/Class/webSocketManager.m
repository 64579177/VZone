//
//  webSocketManager.m
//  VZone
//
//  Created by guo xiaowei on 2017/9/20.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import "webSocketManager.h"

@interface webSocketManager()<SRWebSocketDelegate>

@end

@implementation webSocketManager

-(void)openSocket{

    if( self.webSocket ) {
        [self.webSocket close];
        self.webSocket.delegate = nil;
    }
    
    self.webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://182.92.77.101:8888"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20]];
//    self.webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://182.92.77.101:8888/"]]];
    self.webSocket.delegate = self;
    [self.webSocket open];
    
}
-(void)webSocketDidOpen:(SRWebSocket *)webSocket{
    
    NSLog(@"WebSocket DidOpen");
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic = [@{@"message":@"test萨达11231",@"action":@"allmessage"} mutableCopy];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonString;
    
    jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    [webSocket send:jsonString];//打开socket后根据后端要求传入字典字符串
}

-(void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    
    //socket接收到信息后通过代理传给外部使用
    
}

-(void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean{
    
    NSLog(@"WebSocket closed");
    
}



-(void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error{
    
    NSLog(@":( Websocket Failed With Error %@", error);
    
}


//退出页面时记得关闭webSocket

- (void)closeSocket {
    
    self.webSocket.delegate = nil;
    [self.webSocket close];
    self.webSocket = nil;
}



//外部聊天发送消息给webSocket

- (void)sendTalkMessage:(NSString *)message{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic = [@{ @"content":message} mutableCopy];
    
    [_webSocket send:dic];
    
}


@end
