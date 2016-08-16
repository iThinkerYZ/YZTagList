//
//  YZHobbyCell.m
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZHobbyCell.h"
#import "YZTagList.h"
@interface YZHobbyCell ()



@end

@implementation YZHobbyCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)setTagList:(YZTagList *)tagList
{
    _tagList = tagList;
    
    [self.contentView addSubview:tagList];
}

@end
