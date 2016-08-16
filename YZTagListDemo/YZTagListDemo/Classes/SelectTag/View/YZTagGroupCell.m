//
//  YZTagCell.m
//  YZTagListDemo
//
//  Created by yz on 16/8/16.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZTagGroupCell.h"
#import "YZTagCell.h"
#import "YZTagGroupItem.h"
#import "YZTagItem.h"
extern CGFloat const itemH;
static NSString * const tagCell = @"tagCell";
@interface YZTagGroupCell ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *tagGroupLabel;


@end

@implementation YZTagGroupCell

- (void)awakeFromNib {
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UICollectionViewFlowLayout *layout = self.collectionView.collectionViewLayout;
    CGFloat margin = 10;
    CGFloat cols = 4;
    CGFloat itemW = ([UIScreen mainScreen].bounds.size.width - (cols + 1) * margin) / cols;
    layout.itemSize = CGSizeMake(itemW, itemH);
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;
    
    // 设置collectionView
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"YZTagCell" bundle:nil] forCellWithReuseIdentifier:tagCell];
}



- (void)setTagGroup:(YZTagGroupItem *)tagGroup
{
    _tagGroup = tagGroup;
    _tagGroupLabel.text = tagGroup.name;
    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _tagGroup.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YZTagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:tagCell forIndexPath:indexPath];

    YZTagItem *item = _tagGroup.data[indexPath.row];
    cell.item = item;

    
    return cell;
}
@end
