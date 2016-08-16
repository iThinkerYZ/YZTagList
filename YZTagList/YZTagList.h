//
//  YZTagList.h
//  Hobby
//
//  Created by yz on 16/8/14.
//  Copyright © 2016年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  YZTagList高度会自动跟随标题计算
 */
@interface YZTagList : UIView

/**
 *  标签删除图片
 */
@property (nonatomic, strong) UIImage *tagDeleteimage;

/**
 *  标签内间距,默认10
 */
@property (nonatomic, assign) CGFloat tagMargin;

/**
 *  标签颜色，默认红色
 */
@property (nonatomic, strong) UIColor *tagColor;

/**
 *  标签背景颜色
 */
@property (nonatomic, strong) UIColor *tagBackgroundColor;

/**
 *  标签背景图片
 */
@property (nonatomic, strong) UIImage *tagBackgroundImage;

/**
 *  标签字体，默认13
 */
@property (nonatomic, assign) UIFont *tagFont;

/**
 *  标签按钮内容间距，标签内容距离左上下右间距，默认5
 */
@property (nonatomic, assign) CGFloat tagButtonMargin;

/**
 *  标签圆角半径,默认为5
 */
@property (nonatomic, assign) CGFloat tagCornerRadius;

/**
 *  标签列表的高度
 */
@property (nonatomic, assign) CGFloat tagListH;

/**
 *  边框宽度
 */
@property (nonatomic, assign) CGFloat borderWidth;

/**
 *  边框颜色
 */
@property (nonatomic, strong) UIColor *borderColor;


/**
 *  添加标签
 *
 *  @param tagStr 标签文字
 */
- (void)addTag:(NSString *)tagStr;

/**
 *  添加多个标签
 *
 *  @param tagStrs 标签数组，数组存放（NSString *）
 */
- (void)addTags:(NSArray *)tagStrs;

/**
 *  删除标签
 *
 *  @param tagStr 标签文字
 */
- (void)deleteTag:(NSString *)tagStr;

@end
