//
//  SimpleAlertView.m
//  自定义弹框
//
//  Created by Mrjia on 2018/7/6.
//  Copyright © 2018年 Mrjia. All rights reserved.
//

#define UILABLE_HEIGHT   30
#define LINE_HEIGHT   10
#define ALERTVIEW_HEIGHT [UIScreen mainScreen].bounds.size.height/3
#define ALERTVIEW_WIDTH  [UIScreen mainScreen].bounds.size.width-50
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH  [UIScreen mainScreen].bounds.size.width

#import "SimpleAlertView.h"
#import "Masonry.h"

@interface SimpleAlertView()

@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UILabel *messageLab;
@property (nonatomic,strong)UIView  *alertView;

@end

@implementation SimpleAlertView

-(instancetype)initWithTitle:(NSString *)title Message:(NSString *)message{
    self = [super init];
    if (self) {

        _alertView = [[UIView alloc] initWithFrame:CGRectMake(25, HEIGHT/2-ALERTVIEW_HEIGHT/2, ALERTVIEW_WIDTH, ALERTVIEW_HEIGHT)];
        _alertView.backgroundColor = [UIColor whiteColor];
        _alertView.layer.cornerRadius=5.0;
        _alertView.layer.masksToBounds=YES;
        _alertView.userInteractionEnabled=YES;
        [self addSubview:_alertView];
        self.frame = [UIScreen mainScreen].bounds;

        if (title) {
            _titleLab = [[UILabel alloc]init];
            _titleLab.text = title;
            _titleLab.backgroundColor = [UIColor redColor];
            _titleLab.textAlignment = NSTextAlignmentCenter;
            [_alertView addSubview:_titleLab];
            [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@8);
                make.left.equalTo(@8);
                make.right.equalTo(@-8);
                make.height.equalTo(@30);
            }];
        }
        if (message) {
            _messageLab=[[UILabel alloc]init];
            _messageLab.font=[UIFont systemFontOfSize:15.0];
            _messageLab.text = message;
            _messageLab.numberOfLines = 0;
            _messageLab.lineBreakMode = NSLineBreakByWordWrapping;
            CGSize size = [_messageLab sizeThatFits:CGSizeMake(200, MAXFLOAT)];//根据文字的长度返回一个最佳宽度和高度
            _messageLab.frame = CGRectMake(10, 40, self.alertView.frame.size.width-20, size.height);
                [_alertView addSubview:_messageLab];
        }
        UIButton*sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(20, self.alertView.frame.size.height-50, self.alertView.frame.size.width-40, 44);
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        sureBtn.backgroundColor = [UIColor blueColor];
        [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(sureClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.alertView addSubview:sureBtn];

    }
    [self showView];
    return self;
}

-(void)showView{

    self.backgroundColor = [UIColor whiteColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];

    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);

    self.alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.alertView.alpha = 0;
    [UIView animateWithDuration:0.2 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4f];
        self.alertView.transform = transform;
        self.alertView.alpha = 1;
    } completion:^(BOOL finished) {

    }];
}

-(void)sureClick:(UIButton *)sender{

    LRLog(@"%@",VERSION);
    if (_blockSimple) {
        [self sureBlock:nil];
    }
    [self removeFromSuperview];
}

-(void)sureBlock:(simpleBlock)block{
    _blockSimple = block;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self removeFromSuperview];
}








@end
