//
//  ViewController.m
//  jspathchtext
//
//  Created by 余晔 on 2017/3/7.
//  Copyright © 2017年 余晔. All rights reserved.
//

#import "ViewController.h"
#import "YYSwitchCell.h"


#define d_cell_h @"d_cell_h"
#define d_cell_type @"d_cell_type"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)  UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) NSMutableArray *dataSourcesecond;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [NSMutableArray array];
    self.dataSourcesecond = [NSMutableArray array];
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.rowHeight = 100;
    [self.view addSubview:_tableView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
    [self reloadData];
}

- (void)reloadData{
    [self.dataSource removeAllObjects];
    NSMutableDictionary *rowInfo = [NSMutableDictionary dictionary];

    for (int i =0; i<4; i++) {
        NSString *str = [NSString stringWithFormat:@"%d",i];
        rowInfo = [NSMutableDictionary dictionary];
        rowInfo[d_cell_h] = @(44);
        rowInfo[d_cell_type] = @(YYCellTypeSwitch);
        rowInfo[d_S_title] = str;
        rowInfo[d_S_open] =@(YES);
        [self.dataSource addObject:rowInfo];
        if(i!=3){
            [self.dataSourcesecond addObject:rowInfo];
        }
    }
    
}



#pragma mark - UITabelViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (indexPath.section > 0 && indexPath.row == 0) {
    //        return 40;
    //    }
    //    return 80;
    NSMutableDictionary *rowInfo = self.dataSource[indexPath.row];
    NSNumber *h = rowInfo[d_cell_h];
    return [h floatValue];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    
    NSMutableDictionary *rowInfo = self.dataSource[indexPath.row];
    NSNumber *cellType = rowInfo[d_cell_type];
    switch ([cellType integerValue]) {

        case YYCellTypeSwitch:
        {
            static NSString *identifier = @"YYSwitchCell";
            YYSwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[YYSwitchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            [cell reloadData:rowInfo];
            return cell;
        }
            break;
            
        default:{
            
            static NSString *identifier = @"YYBaseTableViewCell";
            YYBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[YYBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            [cell reloadData:rowInfo];
            return cell;
        }
            break;
    }
    return nil;
    
    
}



//选中cell的协议方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *content = self.dataSource[indexPath.row]; //可能会超出数组范围导致crash
    NSString *contentsecond = self.dataSourcesecond[indexPath.row]; //可能会超出数组范围导致crash

    NSLog(@"第一个：%@",content);
    NSLog(@"第二个：%@",contentsecond);

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
