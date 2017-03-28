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
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController  =   [[VZTabbarViewController alloc]init];
    [self.window makeKeyWindow];
    [UIApplication sharedApplication].statusBarHidden   =   NO;
    [UIApplication sharedApplication].statusBarStyle    =   UIStatusBarStyleLightContent;
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    
//    VZLoginViewController *login    =   [[VZLoginViewController alloc]init];
//    UINavigationController *nav =   [[UINavigationController alloc]initWithRootViewController:login];
//    
//    self.window.rootViewController = nav;
}

-(void)setRootViewController{


}

-(void)setTabbarController{

    
}

-(void)createLoadingScrollView{

}
@end
