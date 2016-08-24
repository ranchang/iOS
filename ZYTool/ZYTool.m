//
//  ZYTool.m
//  ZYTool
//
//  Created by yan zhang on 16/8/24.
//  Copyright © 2016年 yan zhang. All rights reserved.
//

#import "ZYTool.h"

@implementation ZYTool

+ (NSString *)appVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appBuildVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)deviceUUID
{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+ (float)systemVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+ (NSString *)phoneName
{
    return [[UIDevice currentDevice] name];
}

+ (NSString *)systemName
{
    return [[UIDevice currentDevice] systemName];
}

+ (NSString *)phoneModel
{
    return [[UIDevice currentDevice] model];
}

@end
