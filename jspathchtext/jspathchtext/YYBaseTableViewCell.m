//
//  YYBaseTableViewCell.m
//  GoodOpera
//
//  Created by yangyanan on 15/7/21.
//  Copyright (c) 2015年 yangyanan. All rights reserved.
//

#import "YYBaseTableViewCell.h"
@interface YYBaseTableViewCell()
@property (nonatomic,strong) UIView *lineView;
@end
@implementation YYBaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       

    }
    return self;
}
- (void)createLine{
    UIView *lineView = [[UIView alloc] init];
    self.lineView = lineView;
//    UIColor *color = [UIColor colorWithHue:51/255.0 saturation:51/255.0 brightness:51/255.0 alpha:1];
    lineView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:lineView];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[lineView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(lineView)]];
     [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineView(0.5)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(lineView)]];

}

+ (CGSize)calculateTextHeight:(NSString *)text WithRangeSize:(CGSize)rangeSize WithFont:(UIFont *)font
{
    CGSize size;
    if ([[UIDevice currentDevice].systemVersion floatValue]>7.0)
    {
        size = [text boundingRectWithSize:rangeSize
                                  options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                               attributes:@{NSFontAttributeName:font}
                                  context:nil].size;
        
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
        size = [text sizeWithFont:font constrainedToSize:rangeSize lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    }
    return size;
}

- (void)reloadData:(NSMutableDictionary *)rowInfo
{
   
    if (self.lineView) {
         NSNumber *hide = rowInfo[d_cell_hide_line];
        self.lineView.hidden = [hide boolValue];
    }

}
@end
