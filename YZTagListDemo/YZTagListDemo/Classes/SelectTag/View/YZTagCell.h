//
//  YZTagCell.h
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZTagCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (nonatomic, assign) BOOL isSelected;

@end
