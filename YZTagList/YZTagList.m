//
//  YZTagList.m
//  Hobby
//
//  Created by yz on 16/8/14.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZTagList.h"
#import "YZTagButton.h"

CGFloat const imageViewWH = 20;

@interface YZTagList ()
@property (nonatomic, weak) UICollectionView *tagListView;
@property (nonatomic, strong) NSMutableDictionary *tags;
@property (nonatomic, strong) NSMutableArray *tagButtons;
@end

@implementation YZTagList

- (NSMutableArray *)tagButtons
{
    if (_tagButtons == nil) {
        _tagButtons = [NSMutableArray array];
    }
    return _tagButtons;

}

- (NSMutableDictionary *)tags
{
    if (_tags == nil) {
        _tags = [NSMutableDictionary dictionary];
    }
    return _tags;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

#pragma mark - 初始化
- (void)setup
{
    _tagMargin = 10;
    _tagColor = [UIColor redColor];
    _tagButtonMargin = 5;
    _tagCornerRadius = 5;
    _borderWidth = 0;
    _borderColor = _tagColor;
    _tagFont = [UIFont systemFontOfSize:13];
    self.clipsToBounds = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _tagListView.frame = self.bounds;
}

- (CGFloat)tagListH
{
    return CGRectGetMaxY([self.tagButtons.lastObject frame]) + _tagMargin;
}

#pragma mark - 操作标签方法
// 添加多个标签
- (void)addTags:(NSArray *)tagStrs
{
    for (NSString *tagStr in tagStrs) {
        [self addTag:tagStr];
    }
}
// 添加标签
- (void)addTag:(NSString *)tagStr
{
    // 创建标签按钮
    YZTagButton *tagButton = [YZTagButton buttonWithType:UIButtonTypeCustom];
    tagButton.margin = _tagButtonMargin;
    tagButton.layer.cornerRadius = _tagCornerRadius;
    tagButton.layer.borderWidth = _borderWidth;
    tagButton.layer.borderColor = _borderColor.CGColor;
    tagButton.clipsToBounds = YES;
    tagButton.tag = self.tagButtons.count;
    [tagButton setImage:_tagDeleteimage forState:UIControlStateNormal];
    [tagButton setTitle:tagStr forState:UIControlStateNormal];
    [tagButton setTitleColor:_tagColor forState:UIControlStateNormal];
    [tagButton setBackgroundColor:_tagBackgroundColor];
    [tagButton setBackgroundImage:_tagBackgroundImage forState:UIControlStateNormal];
    tagButton.titleLabel.font = _tagFont;
    [tagButton addTarget:self action:@selector(clickTag:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tagButton];
    
    // 保存到数组
    [self.tagButtons addObject:tagButton];
    
    // 保存到字典
    [self.tags setObject:tagButton forKey:tagStr];
    
    // 设置按钮的位置
    [self updateTagButtonFrame:tagButton.tag extreMargin:YES];
    
    // 更新自己的高度
    CGRect frame = self.frame;
    frame.size.height = self.tagListH;
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = frame;
    }];
}

// 点击标签
- (void)clickTag:(UIButton *)button
{
    [self deleteTag:button.currentTitle];
}

// 删除标签
- (void)deleteTag:(NSString *)tagStr
{
    // 获取对应的标题按钮
    YZTagButton *button = self.tags[tagStr];
    
    // 移除按钮
    [button removeFromSuperview];
    
    // 移除数组
    [self.tagButtons removeObject:button];
    
    // 移除字典
    [self.tags removeObjectForKey:tagStr];
    
    // 更新tag
    [self updateTag];
    
    // 更新后面按钮的frame
    [UIView animateWithDuration:0.25 animations:^{
        [self updateLaterTagButtonFrame:button.tag];
    }];
    
    // 更新自己的frame
    CGRect frame = self.frame;
    frame.size.height = self.tagListH;
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = frame;
    }];

}

// 更新标签
- (void)updateTag
{
    NSInteger count = self.tagButtons.count;
    for (int i = 0; i < count; i++) {
        UIButton *tagButton = self.tagButtons[i];
        tagButton.tag = i;
    }
}

// 更新以后按钮
- (void)updateLaterTagButtonFrame:(NSInteger)laterI
{
    NSInteger count = self.tagButtons.count;
    for (NSInteger i = laterI; i < count; i++) {
        // 更新按钮
        [self updateTagButtonFrame:i extreMargin:NO];
    }
}

- (void)updateTagButtonFrame:(NSInteger)i extreMargin:(BOOL)extreMargin
{
    // 获取上一个按钮
    NSInteger preI = i - 1;
    
    // 定义上一个按钮
    UIButton *preButton;
    
    // 过滤上一个角标
    if (preI >= 0) {
        preButton = self.tagButtons[preI];
    }
    
    // 获取当前按钮
    YZTagButton *tagButton = self.tagButtons[i];
    
    // 等于上一个按钮的最大X + 间距
    CGFloat btnX = CGRectGetMaxX(preButton.frame) + _tagMargin;
    
    // 等于上一个按钮的Y值,如果没有就是标签间距
    CGFloat btnY = preButton? preButton.frame.origin.y : _tagMargin;
    
    // 获取按钮宽度
    
    CGFloat titleW = [tagButton.titleLabel.text sizeWithFont:_tagFont].width;
    CGFloat titleH = [tagButton.titleLabel.text sizeWithFont:_tagFont].height;
    CGFloat btnW = extreMargin?titleW + 2 * _tagButtonMargin : tagButton.bounds.size.width ;
    if (_tagDeleteimage && extreMargin == YES) {
        btnW += imageViewWH;
        btnW += _tagButtonMargin;
    }
    
    // 获取按钮高度
    CGFloat btnH = extreMargin? titleH + 2 * _tagButtonMargin:tagButton.bounds.size.height;
    if (_tagDeleteimage && extreMargin == YES) {
        CGFloat height = imageViewWH > titleH ? imageViewWH : titleH;
        btnH = height + 2 * _tagButtonMargin;
    }
    
    // 判断当前按钮是否足够显示
    CGFloat rightWidth = self.bounds.size.width - btnX;
    
    if (rightWidth < btnW) {
        // 不够显示，显示到下一行
        btnX = _tagMargin;
        btnY = CGRectGetMaxY(preButton.frame) + _tagMargin;
    }
    
    tagButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
}

@end
