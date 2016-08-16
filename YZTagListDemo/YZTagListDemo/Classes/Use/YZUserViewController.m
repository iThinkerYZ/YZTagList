//
//  YZUserViewController.m
//  YZTagListDemo
//
//  Created by yz on 16/8/15.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZUserViewController.h"
#import "YZTagList.h"
static int i = 0;

@interface YZUserViewController ()
@property (nonatomic, weak) YZTagList *tagList;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation YZUserViewController

// 添加标签
- (IBAction)addTag:(id)sender {
    
    NSString *tagStr = [NSString stringWithFormat:@"%@  (%d)",_titles[arc4random_uniform(3)],i];
    [_tagList addTag:tagStr];
    i++;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titles = @[@"小码哥",@"峥",@"吖了个峥"];
    
    // 创建标签列表
    YZTagList *tagList = [[YZTagList alloc] init];
    tagList.backgroundColor = [UIColor brownColor];
    _tagList = tagList;
    
    // 点击标签，就会调用,点击标签，删除标签
    __weak typeof(_tagList) weakTagList = _tagList;
    _tagList.clickTagBlock = ^(NSString *tag){
        [weakTagList deleteTag:tag];

    };
    
    // 高度可以设置为0，会自动跟随标题计算
    tagList.frame = CGRectMake(0, 64, self.view.bounds.size.width, 0);
    // 设置标签背景色
    tagList.tagBackgroundColor = [UIColor colorWithRed:20 / 255.0 green:160 / 255.0 blue:250 / 255.0 alpha:1];
    // 设置标签颜色
    tagList.tagColor = [UIColor whiteColor];
    // 设置标签删除图片
    tagList.tagDeleteimage = [UIImage imageNamed:@"chose_tag_close_icon"];
    [self.view addSubview:tagList];
    
}

@end
