//
//  CollectCell.h
//  ChartDemo
//
//  Created by zengxiang on 16/9/2.
//  Copyright © 2016年 haowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *label;
@end

@interface HeaderView : UICollectionReusableView
@property (nonatomic, strong) UILabel *label;
@end

@interface FooterView : UICollectionReusableView
@property (nonatomic, strong) UILabel *label;
@end