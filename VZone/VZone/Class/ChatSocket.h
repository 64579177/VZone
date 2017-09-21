//
//  ChatSocket.h
//  VZone
//
//  Created by guo xiaowei on 2017/9/20.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatSocket : NSObject


@property (nonatomic, copy) NSString *socketHost; //socket的Host
@property (nonatomic, assign) UInt16 socketPort; //socket的prot
@property (nonatomic, retain) NSTimer *connectTimer; //计时器



+ (ChatSocket *)sharedInstance;
-(void)socketConnectHost;// socket连接
-(void)cutOffSocket;// 断开socket连接
@end
