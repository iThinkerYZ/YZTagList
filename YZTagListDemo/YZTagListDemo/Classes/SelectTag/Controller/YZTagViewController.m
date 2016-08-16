//
//  YZTagViewController.m
//  YZTagListDemo
//
//  Created by yz on 16/8/15.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZTagViewController.h"
#import "YZGroupItem.h"
#import "YZTagGroupItem.h"
#import "YZTagList.h"
#import "YZHobbyCell.h"
#import "YZTagGroupCell.h"
#import "YZGroupHeaderView.h"
#import "YZTagCell.h"
#import "YZTagItem.h"
static NSString * const hobbyCell = @"hobbyCell";
static NSString * const tagGroupCell = @"tagGroupCell";
@interface YZTagViewController ()<UICollectionViewDelegate>

@property (nonatomic, strong) YZTagList *tagList;
@property (nonatomic, strong) NSMutableArray *groups;
@property (nonatomic, strong) NSMutableDictionary *selectTagDict;

@end

@implementation YZTagViewController

- (NSMutableDictionary *)selectTagDict
{
    if (_selectTagDict == nil) {
        _selectTagDict = [NSMutableDictionary dictionary];
    }
    return _selectTagDict;
}

- (YZTagList *)tagList
{
    if (_tagList == nil) {
        _tagList = [[YZTagList alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        _tagList.tagBackgroundColor = [UIColor colorWithRed:20 / 255.0 green:145 / 255.0 blue:255 / 255.0 alpha:1];
        _tagList.tagCornerRadius = 7;
        __weak typeof(self) weakSelf = self;
        
        _tagList.clickTagBlock = ^(NSString *tag){
            [weakSelf clickTag:tag];
            
        };
        _tagList.tagColor = [UIColor whiteColor];
    }
    return _tagList;
}

- (void)clickTag:(NSString *)tag
{
    // 删除标签
    [_tagList deleteTag:tag];
    
    // 刷新第0组
    NSIndexSet *indexSex = [NSIndexSet indexSetWithIndex:0];
    [self.tableView reloadSections:indexSex withRowAnimation:UITableViewRowAnimationNone];
    
    // 更新cell标题
    YZTagCell *cell = self.selectTagDict[tag];
    YZTagItem *item = cell.item;
    item.isSelected = !item.isSelected;
    cell.item = item;
    
    // 移除选中的cell
    [self.selectTagDict removeObjectForKey:tag];
}

- (NSArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 每一组cell对应所有标签组
    // 每一个cell对应一个标签组
    
    // 创建第一组
    YZGroupItem *group = [[YZGroupItem alloc] init];
    group.name = @"兴趣课程";
    group.data = [NSMutableArray array];
    [self.groups addObject:group];
    
    YZTagGroupItem *tagGroup = [[YZTagGroupItem alloc] init];
    tagGroup.data = [NSMutableArray array];
    [group.data addObject:tagGroup];
    
    // 添加余下组
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"hobby.plist" ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:filePath];
    
    for (NSDictionary *dict in dictArr) {
        YZGroupItem *group = [YZGroupItem groupWithDict:dict];
        [self.groups addObject:group];
    }
    
    // 注册兴趣cell
    [self.tableView registerClass:[YZHobbyCell class] forCellReuseIdentifier:hobbyCell];
    // 注册标签组cell
    [self.tableView registerNib:[UINib nibWithNibName:@"YZTagGroupCell" bundle:nil] forCellReuseIdentifier:tagGroupCell];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark - Table view data source
// 返回多少个组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

// 返回每一组有多少个标签组
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    YZTagGroupItem *group = self.groups[section];
    return group.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        YZHobbyCell *cell = [tableView dequeueReusableCellWithIdentifier:hobbyCell];
        cell.tagList = self.tagList;
        return cell;
    }
    
    YZGroupItem *group = self.groups[indexPath.section];
    YZTagGroupItem *tagGroup = group.data[indexPath.row];
    
    YZTagGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:tagGroupCell forIndexPath:indexPath];
    cell.collectionView.delegate = self;
    
    cell.tagGroup = tagGroup;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return _tagList.tagListH;
    }
    
    // 获取标签组模型
    YZGroupItem *group = self.groups[indexPath.section];
    YZTagGroupItem *tagGroup = group.data[indexPath.row];
    return tagGroup.cellH;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    YZGroupHeaderView *headerView = [YZGroupHeaderView groupHeaderView];
    headerView.groupItem = self.groups[section];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YZTagCell *cell = (YZTagCell *)[collectionView cellForItemAtIndexPath:indexPath];
    YZTagItem *item = cell.item;
    item.isSelected = !item.isSelected;
    cell.item = item;
    
    NSString *tagStr = [NSString stringWithFormat:@"%@  ×",cell.tagLabel.text];
    if (item.isSelected) {
        // 添加标签
        [self.tagList addTag:tagStr];
        [self.selectTagDict setObject:cell forKey:tagStr];
    } else {
        // 删除标签
        [self.tagList deleteTag:tagStr];
    }
    
    // 刷新第0组
    NSIndexSet *indexSex = [NSIndexSet indexSetWithIndex:0];
    [self.tableView reloadSections:indexSex withRowAnimation:UITableViewRowAnimationNone];
}

@end
