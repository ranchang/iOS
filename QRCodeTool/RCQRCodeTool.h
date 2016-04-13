//
//  RCQRCodeTool.h
//  MideaiPlus
//
//  Created by yan zhang on 16/4/13.
//  Copyright © 2016年 Midea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCQRCodeTool : NSObject
/**
 *  根据字符串生成二维码 CIImage 对象
 *
 *  @param str 需要生成二维码的字符串
 *
 *  @return 生成的二维码
 */
+ (CIImage *)createQRCodeWithStr:(NSString *)str;

/**
 *  改变图片大小 (正方形图片)
 *
 *  @param ciImage 需要改变大小的 CIImage 对象
 *  @param size    图片大小 (正方形图片 只需要一个数)
 *
 *  @return 生成的目标图片
 */
+ (UIImage *)changeImageSizeWithCIImage:(CIImage *)ciImage andSize:(CGFloat)size;

@end
