//
//  YZSortViewController.m
//  YZTagListDemo
//
//  Created by yz on 16/8/18.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZSortViewController.h"
#import "YZTagList.h"

@interface YZSortViewController ()

@end

@implementation YZSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *tags = @[@"小码哥",@"小码哥1",@"小码哥2",@"小码哥3",@"iOS学院",@"iOS学院1",@"iOS学院2",@"iOS学院3",@"吖了个峥",@"吖了个峥1",@"吖了个峥2",@"吖了个峥3"];
    
    // 创建标签列表
    YZTagList *tagList = [[YZTagList alloc] init];
    // 高度可以设置为0，会自动跟随标题计算
    tagList.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    // 设置排序时，缩放比例
    tagList.scaleTagInSort = 1.3;
    // 需要排序
    tagList.isSort = YES;
    // 标签尺寸
    tagList.tagSize = CGSizeMake(80, 30);
    // 不需要自适应标签列表高度
    tagList.isFitTagListH = NO;
    [self.view addSubview:tagList];
    
    // 设置标签背景色
    tagList.tagBackgroundColor = [UIColor colorWithRed:20 / 255.0 green:160 / 255.0 blue:250 / 255.0 alpha:1];
    // 设置标签颜色
    tagList.tagColor = [UIColor whiteColor];
    
    
    /**
     *  这里一定先设置标签列表属性，然后最后去添加标签
     */
    [tagList addTags:tags];
}

@end
