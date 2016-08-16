//
//  YZGroupHeaderView.m
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZGroupHeaderView.h"
#import "YZGroupItem.h"

@interface YZGroupHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *groupLabel;

@end

@implementation YZGroupHeaderView

+ (instancetype)groupHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (void)setGroupItem:(YZGroupItem *)groupItem
{
    _groupItem = groupItem;
    _groupLabel.text = groupItem.name;
}

@end
