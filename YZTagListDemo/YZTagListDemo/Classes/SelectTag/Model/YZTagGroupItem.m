//
//  YZTagGroupItem.m
//  YZTagListDemo
//
//  Created by yz on 16/8/15.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZTagGroupItem.h"
#import "YZTagItem.h"
CGFloat const itemH = 30;
@implementation YZTagGroupItem
+ (instancetype)tagGroupWithDict:(NSDictionary *)dict
{
    YZTagGroupItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}
- (void)setData:(NSMutableArray *)data
{
    NSMutableArray *datas = [NSMutableArray array];
    for (NSDictionary *dict in data) {
        YZTagItem *tagGroup = [YZTagItem tagWithDict:dict];
        [datas addObject:tagGroup];
    }
    _data = datas;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (CGFloat)cellH
{
    CGFloat originY = 27;
    CGFloat margin = 10;
    
    NSInteger cols = 4;
    NSInteger rows = (self.data.count - 1) / cols + 1;
    return rows * (itemH + margin) + originY;
}
@end
