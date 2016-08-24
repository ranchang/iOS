//
//  ZYTool.h
//  ZYTool
//
//  Created by yan zhang on 16/8/24.
//  Copyright © 2016年 yan zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYTool : NSObject

+ (NSString *)appVersion;
+ (NSString *)appBuildVersion;

+ (NSString *)deviceUUID;
+ (float)systemVersion;
+ (NSString *)phoneName;
+ (NSString *)phoneModel;
+ (NSString *)systemName;

@end
