//
//  VZLoginViewController.m
//  VZone
//
//  Created by guo xiaowei on 2017/3/27.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import "VZLoginViewController.h"
#import "NSString+Hash.h"
#import "VZTabbarViewController.h"

#import "webSocketManager.h"

#import "Masonry.h"


@interface VZLoginViewController ()<UINavigationControllerDelegate,getMessageDelete>

@property   (nonatomic,strong) UITextField *userName;
@property   (nonatomic,strong) UIImageView *userImg;
@property   (nonatomic,strong) UITextField *passWord;
@property   (nonatomic,strong) UIImageView *passImg;
@property   (nonatomic,strong) UIImageView *loginBackImg;
@property   (nonatomic,strong) UIImageView *logoImg;
@property   (nonatomic,strong) UIButton    *loginBtn;
@property   (nonatomic,strong) UIButton    *registBtn;


@property   (nonatomic,strong) UIButton *sendMessage;

@property   (nonatomic,strong) webSocketManager *WebSocket;
@end


@implementation VZLoginViewController

-(UIButton*)loginBtn{

    if(!_loginBtn){
    
        _loginBtn = [UIButton new];
        _loginBtn.titleLabel.text = @"登录";
        _loginBtn.titleLabel.textColor  =   kThemeColor;
        _loginBtn.backgroundColor   =   [UIColor redColor];
        [_loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

-(UIButton*)registBtn{
    
    if(!_registBtn){
        
        _registBtn = [UIButton new];
        _registBtn.titleLabel.text  =   @"注册";
        _registBtn.titleLabel.textColor  =   kThemeColor;
        _registBtn.backgroundColor   =   [UIColor redColor];
    }
    return _registBtn;
}

-(UIButton*)sendMessage{
    
    if(!_sendMessage){
        
        _sendMessage = [UIButton new];
        _sendMessage.titleLabel.text  =   @"发消息";
        _sendMessage.titleLabel.textColor  =   kThemeColor;
        _sendMessage.backgroundColor   =   [UIColor redColor];
        [_sendMessage addTarget:self action:@selector(sendmsg) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendMessage;
}

//用户名
-(UITextField*)userName{

    if(!_userName)
    {
        _userName   =   [UITextField new];
        [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
        }];
        _userName.backgroundColor = [UIColor whiteColor];
    }
    return _userName;
}

-(UIImageView *)userImg{
    
    if(!_userImg){
        _userImg  =   [UIImageView new];
        _userImg.image =   VLoadImg(@"logo");
    }
    return _userImg;
}

//密码
-(UITextField*)passWord{

    if(!_passWord){
    
        _passWord   =  [UITextField new];
        _passWord.backgroundColor = [UIColor whiteColor];
    }
    return _passWord;
}

-(UIImageView *)passImg{
    
    if(!_passImg){
        
        _passImg  =   [UIImageView new];
        _passImg.image =   VLoadImg(@"logo");
    }
    return _passImg;
}

-(UIImageView *)loginBackImg{

    if(!_loginBackImg){
    
        _loginBackImg   =   [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        _loginBackImg.image =   VLoadImg(@"login");
    }
    return _loginBackImg;
}

-(UIImageView *)logoImg{
    
    if(!_logoImg){
        
        _logoImg   =   [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW/2-40 , 140, 80, 80)];
        ViewRadius(_logoImg, 40.f);
        _logoImg.image =   VLoadImg(@"logo");
    }
    return _logoImg;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航控制器的代理为self
    self.navigationController.delegate=self;
    //初始化UI
    [self initUI];
    
}

-(void)initUI{

    //登录页背景图
    [self.view addSubview:self.loginBackImg];
    //logo
    [self.loginBackImg addSubview:self.logoImg];
    //登录信息
    [self.view addSubview:self.userName];
    [self.view addSubview:self.passWord];
    
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.registBtn];
    
    [self.view addSubview:self.sendMessage];
    
    NSMutableAttributedString *user_placeholder = [[NSMutableAttributedString alloc]initWithString:@"请输入手机号"];
    [user_placeholder addAttribute:NSForegroundColorAttributeName
                             value:[UIColor whiteColor]
                             range:NSMakeRange(0, 6)];
    [user_placeholder addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:16]
                             range:NSMakeRange(0, 6)];
    self.userName.attributedPlaceholder = user_placeholder;
    
    NSMutableAttributedString *pwd_placeholder = [[NSMutableAttributedString alloc]initWithString:@"请输入密码"];
    [pwd_placeholder addAttribute:NSForegroundColorAttributeName
                            value:[UIColor whiteColor]
                            range:NSMakeRange(0, 5)];
    [pwd_placeholder addAttribute:NSFontAttributeName
                            value:[UIFont systemFontOfSize:16]
                            range:NSMakeRange(0, 5)];
    self.passWord.attributedPlaceholder = pwd_placeholder;
    

}

//登录
-(void)loginClick{

    [VZMineApiManager executeLoginWithUserName:self.userName.text passWord:[self.passWord.text md5String] Finished:^(BOOL success, id response, NSString *message) {
        if(success)
        {
            NSLog(@"登陆成功");
            if (![[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[UITabBarController class]]) {
                
                [UIApplication sharedApplication].keyWindow.rootViewController = [[UITabBarController alloc]init];
                
            }else{
                UITabBarController *tab = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
                tab.selectedIndex = 0;
                
                //                [self conpareVersion:@"2"];
                for (UIView *view in tab.tabBar.subviews) {
                    
                    if ([view isKindOfClass:[UIButton class]]) {
                        
                        UIButton *button = (UIButton*)view;
                        if (view.tag == 8888) {
                            
                            button.enabled = NO;
                            [tab.tabBar setValue:button forKey:@"currentSelected"];
                        }else{
                            
                            button.enabled = YES;
                        }
                    }
                }
                
                [self dismissViewControllerAnimated:YES completion:nil];
                
            }

        }
        
    }];
}

-(void)sendmsg{

    _WebSocket= [[webSocketManager alloc]init];
    [_WebSocket openSocket];
    
}

#pragma mark 一一WebSocket协议方法一一一一一一一一一一一一一一一一一一一一一一一一一一一一
- (void)getMessageFromSocket:(NSDictionary *)message {
    //接收到消息后做相关处理
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.userName resignFirstResponder];
    [self.passWord resignFirstResponder];
}


#pragma mark - UINavigationControllerDelegate

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{

    BOOL isShowHomePage =   [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
