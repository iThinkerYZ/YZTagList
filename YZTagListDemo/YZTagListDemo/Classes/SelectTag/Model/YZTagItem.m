//
//  YZTagItem.m
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZTagItem.h"

@implementation YZTagItem

+ (instancetype)tagWithDict:(NSDictionary *)dict
{
    YZTagItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
