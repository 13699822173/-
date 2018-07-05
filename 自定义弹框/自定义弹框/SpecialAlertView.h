//
//  SpecialAlertView.h
//  自定义弹框
//
//  Created by Mrjia on 2018/7/4.
//  Copyright © 2018年 Mrjia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^sureBlock)(NSString *string);

@interface SpecialAlertView : UIView

-(instancetype) initWithTitleImage:(NSString *)backImage messageTitle:(NSString *)titleStr messageString:(NSString *)contentStr sureBtnTitle:(NSString *)titleString sureBtnColor:(UIColor *)BtnColor;

@property(nonatomic,copy)sureBlock sureClick;

-(void)withSureClick:(sureBlock)block;

@end
