//
//  YZGroupHeaderView.h
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZGroupItem;
@interface YZGroupHeaderView : UIView

@property (nonatomic, strong) YZGroupItem *groupItem;
+ (instancetype)groupHeaderView;

@end
