//
//  YZTagCell.m
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZTagCell.h"

@implementation YZTagCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    
    _tagLabel.textColor = _isSelected?[UIColor colorWithRed:39 / 255.0 green:132 / 255.0 blue:235 / 255.0 alpha:1] : [UIColor colorWithRed:136 / 255.0 green:136 / 255.0 blue:136 / 255.0 alpha:1];
}


@end
