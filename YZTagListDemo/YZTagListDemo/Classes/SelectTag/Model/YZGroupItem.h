//
//  YZGroupItem.h
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZGroupItem : NSObject
{
    @protected NSMutableArray *_data;
}
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *data;
+ (instancetype)groupWithDict:(NSDictionary *)dict;
@end
