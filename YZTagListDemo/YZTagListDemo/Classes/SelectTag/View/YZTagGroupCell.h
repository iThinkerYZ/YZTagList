//
//  YZTagCell.h
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZTagGroupItem;
@interface YZTagGroupCell : UITableViewCell

@property (nonatomic, strong) YZTagGroupItem *tagGroup;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
