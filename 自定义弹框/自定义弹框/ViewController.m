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
#import "SimpleAlertView.h"

@interface ViewController ()

@property(nonatomic,strong)UIButton *customBtn;
@property(nonatomic,strong)UIButton *speciaBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.view addSubview:self.customBtn];
    [self.view addSubview:self.speciaBtn];


    UILabel *label=[[UILabel alloc]init];
    label.font=[UIFont systemFontOfSize:15.0];
    label.text = @"今天天气不错呢，准备到中国参加耐克的活动，中国的球迷准备好了吗？明天早上八点五棵松体育馆见，我爱你们！";
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = [label sizeThatFits:CGSizeMake(200, MAXFLOAT)];//根据文字的长度返回一个最佳宽度和高度
    label.frame = CGRectMake(0, 200, 200, size.height);
//    [self.view addSubview:label];

}


-(UIButton *)customBtn{
    if (!_customBtn) {
        _customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _customBtn.frame = CGRectMake(self.view.frame.size.width/2-30, 100, 80, 40);
        [_customBtn setTitle:@"样式一" forState:UIControlStateNormal];
        _customBtn.tag =0;
        _customBtn.backgroundColor = [UIColor redColor];
        [_customBtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _customBtn;
}

-(UIButton *)speciaBtn{
    if (!_speciaBtn) {
        _speciaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _speciaBtn.frame = CGRectMake(self.view.frame.size.width/2-30, 180, 80, 40);
        [_speciaBtn setTitle:@"样式二" forState:UIControlStateNormal];
        _speciaBtn.tag = 1;
        _speciaBtn.backgroundColor = [UIColor redColor];
        [_speciaBtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _speciaBtn;
}

-(void)Click:(UIButton *)sender{
    if (sender.tag==0) {
        CustomAlertView *alerview = [[CustomAlertView alloc]initBackroundImage:@"beijingkuang_tuan" Title:@"温馨提示" contentString:@"尊敬的用户：\n       现因银行支付通道升级,需要您重新 绑卡验证,您可以通过下面按钮快速绑定 也可以在:  我的>银行卡 界面进行绑定，给您带来的不便，敬请谅解。 " sureButtionTitle:@"立即绑定" cancelButtionTitle:@"暂不绑定"];
        [alerview setSureBolck:^(BOOL clickStatu) {
            NSLog(@"111");
        }];

    }else{
       SpecialAlertView *special = [[SpecialAlertView alloc]initWithTitleImage:@"chsiHeadericon" messageTitle:@"我只是在测试" messageString:@"2018年上半年，碧桂园、恒大、万科等中国十大地产商销售近2万亿元，日均销售额首次突破了100亿大关，达到了108.9亿元，而在去年同期，日均销售额之合85亿元" sureBtnTitle:@"确定" sureBtnColor:[UIColor blueColor]];
        [special withSureClick:^(NSString *string) {
            NSLog(@"222");
        }];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    SimpleAlertView *simple = [[SimpleAlertView alloc]initWithTitle:@"123" Message:@"  今天天气不错呢，准备到中国参加耐克的活动，中国的球迷准备好了吗？明天早上八点五棵松体育馆见，我爱你们！"];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
