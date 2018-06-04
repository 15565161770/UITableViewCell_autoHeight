//
//  TWStatus.m
//  TWTableViewDemo
//
//  Created by 仝兴伟 on 2018/6/4.
//  Copyright © 2018年 TW. All rights reserved.
//

#import "TWStatus.h"

@implementation TWStatus

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
