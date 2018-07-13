//
//  SimpleAlertView.h
//  自定义弹框
//
//  Created by Mrjia on 2018/7/6.
//  Copyright © 2018年 Mrjia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^simpleBlock)(NSString *string);

@interface SimpleAlertView : UIView

-(instancetype)initWithTitle:(NSString *)title Message:(NSString *)message;

@property (nonatomic,copy)simpleBlock blockSimple;

-(void)sureBlock:(simpleBlock)block;
@end
