//
//  ViewController.m
//  自定义弹框
//
//  Created by Mrjia on 2018/7/3.
//  Copyright © 2018年 Mrjia. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertView.h"
#import "SpecialAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    CustomAlertView *alerview = [[CustomAlertView alloc]initBackroundImage:@"beijingkuang_tuan" Title:@"温馨提示" contentString:@"尊敬的用户：\n       现因银行支付通道升级,需要您重新 绑卡验证,您可以通过下面按钮快速绑定 也可以在:  我的>银行卡 界面进行绑定，给您带来的不便，敬请谅解。 " sureButtionTitle:@"立即绑定" cancelButtionTitle:@"暂不绑定"];
//    [alerview setSureBolck:^(BOOL clickStatu) {
//        NSLog(@"111");
//    }];

    SpecialAlertView *special = [[SpecialAlertView alloc]initWithTitleImage:@"beijingkuang_tuan" messageTitle:@"我只是在测试" messageString:@" 现因银行支付通道升级,需要您重新 绑卡验证,您可以通过下面按钮快速绑定 也可以在:  我的>银行卡 界面进" sureBtnTitle:@"确定" sureBtnColor:[UIColor blueColor]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
