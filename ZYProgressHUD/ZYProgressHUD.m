//
//  ZYProgressHUD.m
//  ZYTool
//
//  Created by yan zhang on 16/8/26.
//  Copyright © 2016年 yan zhang. All rights reserved.
//

#import "ZYProgressHUD.h"

@interface ZYProgressHUD ()

@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, strong) UIView *backgroundView;

@end

@implementation ZYProgressHUD

+ (ZYProgressHUD *)progressHUD
{
    static ZYProgressHUD *_progressHUD;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _progressHUD = [[ZYProgressHUD alloc] init];
    });
    return _progressHUD;
}

- (void)showMessage:(NSString *)message
{
    _backgroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _backgroundView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroundView];
    
    _hud = [[MBProgressHUD alloc] initWithView:self.backgroundView];
    _hud.removeFromSuperViewOnHide = YES;
    _hud.bezelView.color = [UIColor whiteColor];
    _hud.activityIndicatorColor = [UIColor colorWithRed:54.0/255 green:188.0/255 blue:138.0/255 alpha:1.0];
    _hud.square = YES;
    _hud.label.text = message;
    _hud.label.textColor = [UIColor colorWithRed:54.0/255 green:188.0/255 blue:138.0/255 alpha:1.0];
    [_backgroundView addSubview:_hud];
    [_hud showAnimated:YES];
}


- (void)hide
{
    [_hud hideAnimated:YES];
    [_backgroundView removeFromSuperview];
}

@end
