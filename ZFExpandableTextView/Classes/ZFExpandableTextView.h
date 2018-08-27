//
//  ZFAutoPlaceholderTextView.h
//  CheckBoxTableViewDemo
//
//  Created by mac on 2018/7/31.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFExpandableTextView : UITextView

/**
 最大行数
 */
@property (nonatomic, assign) NSInteger maxNumberOfLines;

/**
 是否可扩展
 */
@property (nonatomic, assign) BOOL isExpandable;

/**
 占位符
 
 @param ph 占位符
 */
- (void)setPlaceholder:(NSString *)ph;

/**
 设置最大行数
 
 @param maxNumberOfLines 最大行数
 */
- (void)setMaxNumberOfLines:(NSInteger)maxNumberOfLines;

/**
 设置字体大小
 
 @param size 字体大小
 */
- (void)setFontSize:(CGFloat)size;

/**
 设置是否可拓展

 @param isExpandable 是否可拓展
 */
- (void)setIsExpandable:(BOOL)isExpandable;

@end
