//
//  ZFAutoPlaceholderTextView.m
//  CheckBoxTableViewDemo
//
//  Created by mac on 2018/7/31.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZFExpandableTextView.h"

@interface ZFExpandableTextView ()

/**
 用一个UILabel假扮占位符
 */
@property (nonatomic, strong)UILabel *placeholderLabel;

/**
 当前字体的高
 */
@property (nonatomic, assign)NSInteger textViewHeight;

/**
 允许的最大高度
 */
@property (nonatomic, assign) NSInteger maxTextHeight;

@end

@implementation ZFExpandableTextView

#pragma mark - initialize
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollEnabled = NO;
        self.scrollsToTop = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.isExpandable = YES;
        [self setMaxNumberOfLines:4];
        
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        //监听外部输入的情况
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        
        //监听对程序内对self.text赋值的情况
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(text)) options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}

#pragma mark - interface
//设置placeholder内容
- (void)setPlaceholder:(NSString *)ph {
    self.placeholderLabel.text = ph;
}

//设置文字大小
- (void)setFontSize:(CGFloat)size {
    self.font = [UIFont systemFontOfSize:size];
    [self setMaxNumberOfLines:_maxNumberOfLines];
}

//设置最大行数
- (void)setMaxNumberOfLines:(NSInteger)maxNumberOfLines {
    _maxNumberOfLines = maxNumberOfLines;
    
    //！！设置TextView最大高度=每行高度 * 最大行数 + 文字间距
    _maxTextHeight = ceil(self.font.lineHeight * maxNumberOfLines + self.textContainerInset.top + self.textContainerInset.bottom);
}

//设置内容
- (void)setText:(NSString *)text {
    [super setText:text];
    [self textDidChange];
}

#pragma mark - 设置监听
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(text))]) {
        //有文字则隐藏placeholder
        self.placeholderLabel.hidden = (self.text.length > 0);
    }
}

- (void)textDidChange {
    //有文字则隐藏placeholder
    self.placeholderLabel.hidden = (self.text.length > 0);
    
    //获取当前文字的高度
    NSInteger height = ceilf([self sizeThatFits:CGSizeMake(self.bounds.size.width, MAXFLOAT)].height);
    
    //高度是否等于原来的高度？
    if (_textViewHeight != height && self.isExpandable) {
        //不等于
        //当前高度是否已经超过最大高度？是则让ScrollView可以滚动，并不改变TextView高度
        self.scrollEnabled = height > _maxTextHeight;
        
        //将原来高度变成当前文字高度
        _textViewHeight = height;
        
        //当不可以滚动（即 <= 最大高度）时，传值改变textView高度
        if (self.scrollEnabled == NO ) {
            [self changeHeight:height];
        }
    }
    if (!self.isExpandable) {
        self.scrollEnabled = YES;
    }
}

//修改高度
- (void)changeHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - dealloc
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(text))];
}

#pragma mark - lazy
- (UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
        _placeholderLabel.font = self.font;
        _placeholderLabel.textColor = [UIColor lightGrayColor];
        _placeholderLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_placeholderLabel];
    }
    return _placeholderLabel;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
