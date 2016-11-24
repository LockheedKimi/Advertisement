//
//  BannerPictureView.h
//  Advertisement
//
//  Created by Kimi.zhang on 2016/11/22.
//  Copyright © 2016年 Kimi.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
//声明协议
@protocol BannerPictureViewDelagate;

@interface BannerPictureView : UIView
//声明pageControll
@property (nonatomic, strong, readonly) UIPageControl *pageControll;

@property (nonatomic, assign) id <BannerPictureViewDelagate> delegate;


- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<UIImage *> *)images isAutoScroll:(BOOL)isAuto;

+ (instancetype)scrollPictureViewWithFrame:(CGRect)frame urlStrings:(NSArray<NSString *> *)urlStrings isAutoScroll:(BOOL)isAuto block:(void(^)(BannerPictureView *scrollPictureView))block;

- (void)updateBannerWithUrlStrings:(NSArray<NSString *> *)urlStrings;

- (void)setPageControllFrame:(CGRect)frame;

- (void)setPageIndicatorTintColor:(UIColor *)color;

- (void)setCurrentPageIndicatorTintColor:(UIColor *)color;

- (void)startScroll;

- (void)pauseScroll;

@end

@protocol BannerPictureViewDelagate <NSObject>

@optional

- (void)scrollPictureView:(BannerPictureView *)scrollPictureView didSelectedItemAtIndex:(NSInteger)index;
- (void)scrollPictureView:(BannerPictureView *)scrollPictureView didScorllingAtIndex:(NSInteger)index;

@end
