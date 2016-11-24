//
//  UIColor+RCColor.h
//  RCloudMessage
//
//  Created by Liv on 16/1/20.
//  Copyright (c) 2016年 kimi.zhang All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RCColor)

#pragma mark - 字符串色值识别
/**
 *⭐️.>>>>字符串色值识别<<<<<<⭐️
 *
 *
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
