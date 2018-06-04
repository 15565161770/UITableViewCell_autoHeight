//
//  TWStatusFrame.h
//  TWTableViewDemo
//
//  Created by 仝兴伟 on 2018/6/4.
//  Copyright © 2018年 TW. All rights reserved.
//  根据模型计算cell的高度

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class TWStatus;
/** 专门计算所有控件位置*/
@interface TWStatusFrame : NSObject
/* 头像尺寸位置**/
@property (nonatomic, assign, readonly) CGRect iconF;
/* 名字尺寸位置**/
@property (nonatomic, assign, readonly) CGRect nameF;
/* 级别尺寸位置**/
@property (nonatomic, assign, readonly) CGRect vipF;
/* 文本尺寸位置**/
@property (nonatomic, assign, readonly) CGRect textF;
/* 图片尺寸位置**/
@property (nonatomic, assign, readonly) CGRect pictureF;

/** 行高 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;


/** 所有控件的尺寸都可以通过Status模型来计算得出 */
@property (nonatomic, strong) TWStatus *status;

/** 所有的statusFrame数组*/
+ (NSArray *)statusFrames;
@end
