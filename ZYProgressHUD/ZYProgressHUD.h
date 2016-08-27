//
//  ZYProgressHUD.h
//  ZYTool
//
//  Created by yan zhang on 16/8/26.
//  Copyright © 2016年 yan zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

#define ZYProgressHUDUtil [ZYProgressHUD progressHUD]

@interface ZYProgressHUD : NSObject

+ (ZYProgressHUD *)progressHUD;
- (void)showMessage:(NSString *)message;
- (void)hide;

@end
