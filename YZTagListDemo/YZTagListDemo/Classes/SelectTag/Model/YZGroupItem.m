//
//  YZGroupItem.m
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZGroupItem.h"
#import "YZTagGroupItem.h"

@implementation YZGroupItem

+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    YZGroupItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

- (void)setData:(NSMutableArray *)data
{
    NSMutableArray *datas = [NSMutableArray array];
    
    for (NSDictionary *dict in data) {
        YZTagGroupItem *tagGroup = [YZTagGroupItem tagGroupWithDict:dict];
        [datas addObject:tagGroup];
    }
    
    _data = datas;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
