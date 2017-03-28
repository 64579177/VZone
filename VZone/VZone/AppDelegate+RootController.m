//
//  AppDelegate+RootController.m
//  VZone
//
//  Created by guo xiaowei on 2017/3/27.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import "AppDelegate+RootController.h"
#import "VZLoginViewController.h"
#import "VZTabbarViewController.h"

@implementation AppDelegate (RootController)

- (void)setAppWindows
{
    //系统创建window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //设置背景颜色
    self.window.backgroundColor = [UIColor whiteColor];
    //设置为主窗口并显示出来
    [self.window makeKeyAndVisible];
    
    VZLoginViewController *login    =   [[VZLoginViewController alloc]init];
    UINavigationController *nav =   [[UINavigationController alloc]initWithRootViewController:login];
    
    self.window.rootViewController = nav;
}

-(void)setRootViewController{


}

-(void)setTabbarController{

    
}

-(void)createLoadingScrollView{

}
@end
