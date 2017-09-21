//
//  webSocketManager.h
//  VZone
//
//  Created by guo xiaowei on 2017/9/20.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SocketRocket/SRWebSocket.h>
#import "SRWebSocket.h"

//设置接受外部消息的代理
@protocol getMessageDelete <NSObject>

-(void)getMessageFromSocket:(NSDictionary*)message;
@end


@interface webSocketManager : NSObject//签socket协议

@property   (nonatomic,assign) id<getMessageDelete>delegate;
@property   (nonatomic,strong)  SRWebSocket *webSocket;


-(void)openSocket;
-(void)closeSocket;
- (void)sendTalkMessage:(NSString *)message;

@end
