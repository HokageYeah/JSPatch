//
//  YYBaseTableViewCell.h
//  GoodOpera
//
//  Created by yangyanan on 15/7/21.
//  Copyright (c) 2015年 yangyanan. All rights reserved.
//


#define RGB__COLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]



#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height


//#define ColorDebug

#ifdef ColorDebug
#define RedColor [UIColor redColor]
#define BlueColor [UIColor blueColor]
#define YellowColor [UIColor yellowColor]
#else
#define RedColor [UIColor clearColor]
#define BlueColor [UIColor clearColor]
#define YellowColor [UIColor clearColor] 
#endif


#define l_padding 15
#define text_size 15
#define text_sub_size 11

//#define main_text_color  [UIColor colorWithRed:94.0/255.0 green:96.0/255.0 blue:88.0/255.0 alpha:1.0]
#define main_text_color  [UIColor blackColor]
#define sub_text_color     [UIColor colorWithRed:154.0/255.0 green:154.0/255.0 blue:154.0/255.0 alpha:1.0]

#import <UIKit/UIKit.h>
#define d_cell_h @"d_cell_h"
#define d_cell_type @"d_cell_type"
#define d_cell_click_type @"d_cell_click_type"
#define d_cell_hide_line @"d_cell_hide_line"

typedef NS_ENUM(NSUInteger, YYCellType) {
    YYCellTypeSwitch=1,//带有开关的cell
    YYCellTypeText ,
    YYCellTypeTitleArrow,
    YYCellTypeImgArrow,
    YYCellTypeSpace,
    YYCellTypeTitleField,
    YYCellTypeButtons,
    YYCellTypeImages,
    YYCellTypeMsgList,
    YYCellTypeDate,
    YYCellTypePerson,
    YYCellTypeTwoItem,
    YYCellTypeImgTitleArrow,
    YYCellTypeMulitipleState,
    YYCellTypeMarkup,
    YYCellTypeTwoTitleArrow,
    YYCellTypeRightButtonAow,
    YYCellTypeLeftImgLabel,
    YYCellTypeHeightCalculation,
    YYCellTypePersonAndLocation,
    YYCellTypeTwoLabels,
    YYCellTypeImgCenterLabel,
    YYCellTypeDrawingImg,
    YYCellTypeRightArrowImg,
    YYCellTypeTwoLabelArrows,
    YYCellTypeThreeImgClick,
    YYCellTypeClickPlusOne,
    YYCellTypePasswordDrawImg,
    YYCellTypeOnlyOneButton,
    YYCellTypeTextStretchZixun,
    YYCellTypeDrugDetailsTop,
    YYCellTypeCenterImgLabel,
    YYCellTypeTwoViewCenterLabel,
    YYCellTypeLabelRightButton,
    YYCellTypeThreeButtonsLabels,
    YYCellTypeVariousTypeText,
    YYCellTypeTwoLabelsSequence,
    YYCellTypeTextWithBorders,
    YYCellTypeTopRound,
    YYCellTypeBottomRounds,
    YYCellTypeLargeRoundButton,
    YYCellTypeLabelLineRightArrow,
    YYCellTypeLabelTopLines,
    YYCellTypeDoubleSideButtonCell,
    YYCellTypeWithEditBoxLayout,
    YYCellTypeButtonWithLabels,
    YYCellTypeButtonDifferent,
    YYCellTypeMoreRoundedText,
    YYCellTypeNoRoundImgText,
    YYCellTypeRichTextButtonDate,
    YYCellTypeThreeLabel,
    YYCellTypeTextWithTextField,
    YYCellTypeTextWithButtonArrow,
    YYCellTypeSelectdeEffectText,
    YYCellTypeWithTwoDifferentButtons,
    YYCellTypeTwoButtonsTextBelow,
    YYCellTypeTwoSideLineCntreLabel,
    YYCellTypeTwoSavesLabels,
    YYCellTypePluralityImageTextButton,
    YYCellTypeFixedRoundAspect,
    YYCellTypeStrechMiddleImage,



};

@interface YYBaseTableViewCell : UITableViewCell
- (void)reloadData:(NSMutableDictionary *)rowInfo;
- (void)createLine;
+ (CGSize)calculateTextHeight:(NSString *)text WithRangeSize:(CGSize)rangeSize WithFont:(UIFont *)font;
@end






