//
//  YYSwitchCell.m
//  GoodOpera
//
//  Created by yangyanan on 15/7/23.
//  Copyright (c) 2015年 yangyanan. All rights reserved.
//

#import "YYSwitchCell.h"
@interface YYSwitchCell()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UISwitch *mySwitch;

@end
@implementation YYSwitchCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel.backgroundColor = RedColor;
        self.titleLabel.font = [UIFont systemFontOfSize:text_size];
        self.titleLabel.textColor = main_text_color;
        [self.contentView addSubview:self.titleLabel];
        
        self.mySwitch = [[UISwitch alloc] init];
        self.mySwitch.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.mySwitch];
        
        [self.mySwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-p-[_titleLabel(<=200)]-(>=0)-[_mySwitch]-8-|" options:0 metrics:@{@"p":@(l_padding)} views:NSDictionaryOfVariableBindings(_titleLabel,_mySwitch)]];
         [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_titleLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel,_mySwitch)]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_mySwitch attribute:NSLayoutAttributeCenterY relatedBy:0 toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        [self createLine];
    }
    return self;
}
- (void)reloadData:(NSMutableDictionary *)rowInfo{
    [super reloadData:rowInfo];
    
    NSString *title = rowInfo[d_S_title];
    NSNumber *is_open = rowInfo[d_S_open];
    self.titleLabel.text = title;
    self.mySwitch.on = [is_open boolValue];
    
}

- (void)switchAction:(UISwitch *)sch{
    BOOL issch = [sch isOn];
    if (self.delegate && [self.delegate respondsToSelector:@selector(YYSwitchCell:withBool:)]) {
        [self.delegate YYSwitchCell:self withBool:issch];
    }
    
}

@end
