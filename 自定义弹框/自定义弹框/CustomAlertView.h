//
//  CustomAlertView.h
//  自定义弹框
//
//  Created by Mrjia on 2018/7/3.
//  Copyright © 2018年 Mrjia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^sureBtnClick)(BOOL clickStatu);

@interface CustomAlertView : UIView

-(instancetype)initBackroundImage:(NSString *)imageB Title:(NSString *)tltleString contentString:(NSString *)contentString sureButtionTitle:(NSString *)sureBtnstring cancelButtionTitle:(NSString *)cancelBtnString ;

@property (nonatomic,copy)sureBtnClick sureBolck;

-(void)clickSureBtn:(sureBtnClick) block;

@end
