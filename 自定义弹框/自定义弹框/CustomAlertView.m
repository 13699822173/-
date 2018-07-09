//
//  CustomAlertView.m
//  自定义弹框
//
//  Created by Mrjia on 2018/7/3.
//  Copyright © 2018年 Mrjia. All rights reserved.
//
#define ALERTVIEW_HEIGHT [UIScreen mainScreen].bounds.size.height/3
#define ALERTVIEW_WIDTH  [UIScreen mainScreen].bounds.size.width-50
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH  [UIScreen mainScreen].bounds.size.width


#import "CustomAlertView.h"

@interface CustomAlertView()<UIGestureRecognizerDelegate>
@property (nonatomic,strong)UIView *alertView;
@property (nonatomic,strong)UIView *otherBtnView;

@end

@implementation CustomAlertView

-(instancetype)initBackroundImage:(NSString *)imageB Title:(NSString *)tltleString contentString:(NSString *)contentString sureButtionTitle:(NSString *)sureBtnstring cancelButtionTitle:(NSString *)cancelBtnString {

    self = [super init];
    if (self) {

        _alertView = [[UIView alloc] initWithFrame:CGRectMake(25, HEIGHT/2-ALERTVIEW_HEIGHT/2, ALERTVIEW_WIDTH, ALERTVIEW_HEIGHT)];
        _alertView.backgroundColor = [UIColor whiteColor];
        _alertView.layer.cornerRadius=5.0;
        _alertView.layer.masksToBounds=YES;
        _alertView.userInteractionEnabled=YES;
        [self addSubview:_alertView];

        self.frame = [UIScreen mainScreen].bounds;

        _otherBtnView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2-15, HEIGHT/2+ALERTVIEW_HEIGHT/2, 30, 80)];
        _otherBtnView.backgroundColor = [UIColor clearColor];
        [self addSubview:_otherBtnView];

        UIButton *otherBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 80)];
        otherBtn.backgroundColor = [UIColor clearColor];
        [otherBtn addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
        [otherBtn setBackgroundImage:[UIImage imageNamed:@"quxiao"] forState:UIControlStateNormal];
        [_otherBtnView addSubview:otherBtn];

        if (imageB) {
            UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,ALERTVIEW_WIDTH , ALERTVIEW_HEIGHT)];
            backImage.image = [UIImage imageNamed:imageB];
            [_alertView addSubview:backImage];
        }
        if (tltleString) {
            UILabel *titleLabe = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 80, 30)];
            titleLabe.text = tltleString;
            titleLabe.textAlignment = NSTextAlignmentLeft;
            titleLabe.font = [UIFont systemFontOfSize:17];
            titleLabe.textColor = [UIColor blackColor];
            [_alertView addSubview:titleLabe];
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 35, 75, 2)];
            lineView.backgroundColor = [UIColor blueColor];
            [_alertView addSubview:lineView];
        }
        
        if (contentString) {
            UILabel *contentLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 40, ALERTVIEW_WIDTH-30, ALERTVIEW_HEIGHT/2)];
            contentLab.text = contentString;
            contentLab.textColor = [UIColor colorWithRed:47/255 green:60/255 blue:67/255 alpha:1];
            contentLab.font = [UIFont systemFontOfSize:16];
            contentLab.textAlignment = NSTextAlignmentLeft;
            contentLab.numberOfLines = 0;
            [_alertView addSubview:contentLab];

        }

        if (sureBtnstring) {
            UIButton *OkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            OkBtn.frame = CGRectMake(ALERTVIEW_WIDTH-(ALERTVIEW_WIDTH-10)/2, ALERTVIEW_HEIGHT-50, (ALERTVIEW_WIDTH-30)/2, 35);
            [OkBtn setTitle:sureBtnstring forState:UIControlStateNormal];
            OkBtn.backgroundColor = [UIColor blueColor];
            OkBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            OkBtn.layer.cornerRadius=3;
            OkBtn.layer.masksToBounds=YES;
            [OkBtn addTarget:self action:@selector(sureClick:) forControlEvents:UIControlEventTouchUpInside];
            [_alertView addSubview:OkBtn];

        }
        if (cancelBtnString) {
            UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, ALERTVIEW_HEIGHT-50, (ALERTVIEW_WIDTH-30)/2, 35)];
            [cancelBtn setTitle:cancelBtnString forState:UIControlStateNormal];
            cancelBtn.backgroundColor = [UIColor lightGrayColor];
            cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            cancelBtn.layer.cornerRadius=3;
            cancelBtn.layer.masksToBounds=YES;
            [cancelBtn addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
            [_alertView addSubview:cancelBtn];

        }
    }

   [self showView];
    return  self;
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
    self.otherBtnView.transform =CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.otherBtnView.alpha = 0;
    [UIView animateWithDuration:0.2 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4f];
        self.otherBtnView.transform = transform;
        self.otherBtnView.alpha = 1;
    } completion:^(BOOL finished) {

    }];
}

-(void)cancelClick:(UIButton *)sender{
    [UIView animateWithDuration:0.3 animations:^{
        [self removeFromSuperview];
    }];
}

-(void)sureClick:(UIButton *)sender{

    if (self.sureBolck!=nil) {
        self.sureBolck(nil);
    }
    [self cancelClick:sender];
}

-(void)clickSureBtn:(sureBtnClick)block{
    _sureBolck = block;
}


@end
