//
//  VZLoginViewController.m
//  VZone
//
//  Created by guo xiaowei on 2017/3/27.
//  Copyright © 2017年 guo xiaowei. All rights reserved.
//

#import "VZLoginViewController.h"

@interface VZLoginViewController ()

@property   (nonatomic,strong) UITextView *userName;
@property   (nonatomic,strong) UITextView *passWord;
@end


@implementation VZLoginViewController

//用户名
-(UITextView*)userName{

    if(!_userName)
    {
    
        _userName   =   [[UITextView alloc]initWithFrame:CGRectMake(30,120*VZHeight_Scale , kScreenW-30*2, 30*VZHeight_Scale)];
    }
    return _userName;
}

//密码
-(UITextView*)passWord{

    if(!_passWord){
    
        _passWord   =   [[UITextView alloc]initWithFrame:CGRectMake(30,160*VZHeight_Scale , kScreenW-30*2, 30*VZHeight_Scale)];
    }
    return _passWord;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
}

-(void)initUI{

    self.view.backgroundColor   =   [UIColor redColor];
    [self.view addSubview:self.userName];
    [self.view addSubview:self.passWord];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
