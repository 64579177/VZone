//
//  VZLoginViewController.m
//  VZone
//
//  Created by guo xiaowei on 2017/3/27.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import "VZLoginViewController.h"
#import "NSString+Hash.h"


@interface VZLoginViewController ()<UINavigationControllerDelegate>

@property   (nonatomic,strong) UITextField *userName;
@property   (nonatomic,strong) UITextField *passWord;
@property   (nonatomic,strong) UIImageView *loginBackImg;
@property   (nonatomic,strong) UIImageView *logoImg;
@property   (nonatomic,strong) UIButton     *loginBtn;
@property   (nonatomic,strong) UIButton     *registBtn;
@end


@implementation VZLoginViewController

-(UIButton*)loginBtn{

    if(!_loginBtn){
    
        _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(88,420*VZHeight_Scale , (kScreenW-88*2-40)/2,25 )];
        _loginBtn.titleLabel.text = @"登录";
        _loginBtn.titleLabel.textColor  =   kThemeColor;
        _loginBtn.backgroundColor   =   [UIColor blackColor];
        [_loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

-(UIButton*)registBtn{
    
    if(!_registBtn){
        
        _registBtn = [[UIButton alloc]initWithFrame:CGRectMake(88+(kScreenW-88*2)/2+40,420*VZHeight_Scale , (kScreenW-88*2-40)/2, 25)];
        _registBtn.titleLabel.text  =   @"注册";
        _registBtn.titleLabel.textColor  =   kThemeColor;
        _registBtn.backgroundColor   =   [UIColor blackColor];
    }
    return _registBtn;
}

//用户名
-(UITextField*)userName{

    if(!_userName)
    {
    
        _userName   =   [[UITextField alloc]initWithFrame:CGRectMake(88,320*VZHeight_Scale , kScreenW-88*2, 30*VZHeight_Scale)];
    }
    return _userName;
}

//密码
-(UITextField*)passWord{

    if(!_passWord){
    
        _passWord   =   [[UITextField alloc]initWithFrame:CGRectMake(88,380*VZHeight_Scale , kScreenW-88*2, 30*VZHeight_Scale)];
    }
    return _passWord;
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
