//
//  YYSwitchCell.h
//  GoodOpera
//
//  Created by yangyanan on 15/7/23.
//  Copyright (c) 2015年 yangyanan. All rights reserved.
//

#import "YYBaseTableViewCell.h"
#define d_S_title @"d_switch_title"
#define d_S_open @"d_switch_open"

@protocol YYSwitchCellDelegate;
@interface YYSwitchCell : YYBaseTableViewCell
@property (nonatomic,weak) id<YYSwitchCellDelegate>delegate;
@end

@protocol YYSwitchCellDelegate <NSObject>

- (void)YYSwitchCell:(YYSwitchCell *)Cell withBool:(BOOL)isBool;

@end