//
//  flowLayout.h
//  ChartDemo
//
//  Created by zengxiang on 16/9/2.
//  Copyright © 2016年 haowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface flowLayout : UICollectionViewFlowLayout

/**
 @param column 需要设置好多少列，一般都是采取固定列数的方式 
 */
- (instancetype)initWithFrame:(CGRect)frame column:(NSInteger)column;

/**
 获取列表的所有高度
 
 @param counts 列表item总数
 
 @return 返回表格高度，仅cell
 */
- (CGFloat)collectionViewHeightWithItemCounts:(NSInteger)counts;
@end
