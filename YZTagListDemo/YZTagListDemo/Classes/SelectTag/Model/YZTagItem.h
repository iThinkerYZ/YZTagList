//
//  YZTagItem.h
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZTagItem : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL isSelected;
+ (instancetype)tagWithDict:(NSDictionary *)dict;
@end
