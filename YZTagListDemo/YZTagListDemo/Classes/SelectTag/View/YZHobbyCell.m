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

- (void)setTagList:(YZTagList *)tagList
{
    _tagList = tagList;
    
    [self.contentView addSubview:tagList];
}

@end
