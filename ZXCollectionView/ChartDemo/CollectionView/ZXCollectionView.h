//
//  ZXCollectionView.h
//  ChartDemo
//
//  Created by zengxiang on 16/9/2.
//  Copyright © 2016年 haowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXCollectionView : UIView

@property (nonatomic, assign) NSInteger row;  //行数
@property (nonatomic, assign) NSInteger column; //列数
@property (nonatomic, copy) NSString *headerViewTitle; //headerView label title,if has,default no
@property (nonatomic, copy) NSString *footerViewTitle; //footerView label title,if has,default no

- (instancetype)initWithFrame:(CGRect)frame itemArray:(NSMutableArray *)itemArray;
- (CGFloat)height;
@end
