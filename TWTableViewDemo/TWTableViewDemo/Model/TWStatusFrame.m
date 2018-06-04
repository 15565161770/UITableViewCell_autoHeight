//
//  TWStatusFrame.m
//  TWTableViewDemo
//
//  Created by 仝兴伟 on 2018/6/4.
//  Copyright © 2018年 TW. All rights reserved.
//

#import "TWStatusFrame.h"
#import "TWStatus.h"
#import "NSString+Tools.h"

/** 姓名字体 */
#define kNameFont   [UIFont systemFontOfSize:14]
/** 正文字体 */
#define kTextFont   [UIFont systemFontOfSize:16]

@implementation TWStatusFrame

/**
 一旦写 readonly属性的getter方法，_的成员变量就不存在了
 如果还需要使用_成员变量，则需要使用@synthesize生成对应的成员变量
 */

-(void)setStatus:(TWStatus *)status {
    _status = status;
    
    // 0 定义间距
    CGFloat padding = 10;
    
    // 1 头像
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 姓名大小由文字的长度来决定
    NSDictionary *nameDict = @{NSFontAttributeName : kNameFont};
    CGRect nameFrame = [self.status.name textRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) attributes:nameDict];
    nameFrame.origin.x = CGRectGetMaxX(self.iconF) + padding;
    // 姓名现在头像高度居中
    nameFrame.origin.y = padding + (self.iconF.size.height - nameFrame.size.height) *0.5;
    _nameF = nameFrame;
    
    // vip图标
    CGFloat vipX = CGRectGetMaxX(self.nameF) + padding;
    CGFloat vipY = self.nameF.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    _vipF = CGRectMake(vipX, vipY, vipW, vipH);
    
    // 正文
    NSDictionary *textDict = @{NSFontAttributeName:kTextFont};
    CGRect textFrame = [self.status.text textRectWithSize:CGSizeMake(300, MAXFLOAT) attributes:textDict];
    textFrame.origin.x = padding;
    textFrame.origin.y = CGRectGetMaxY(self.iconF) + padding;
    _textF = textFrame;
    
    // 配图(这里是添加一张配图)
    if (self.status.picture.length > 0) {
        CGFloat pictureX = padding;
        CGFloat pictureY = CGRectGetMaxY(textFrame) + padding;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        _cellHeight = CGRectGetMaxY(self.pictureF) + padding;
    } else {
        _cellHeight = CGRectGetMaxY(self.textF) + padding;
    }
}

// 加载数据模型
+ (NSArray *)statusFrames {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        TWStatusFrame *statusFrame = [[TWStatusFrame alloc]init];
        TWStatus *status = [TWStatus statusWithDict:dict];
        statusFrame.status = status;
        // 将statusFrame添加到数组
        [arrayM addObject:statusFrame];
    }
    return arrayM;
}






































@end
