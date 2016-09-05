//
//  CollectCell.m
//  ChartDemo
//
//  Created by zengxiang on 16/9/2.
//  Copyright © 2016年 haowu. All rights reserved.
//

#import "CollectCell.h"

static CGFloat const W = 0;//60;
@implementation CollectCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height - W)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont boldSystemFontOfSize:12.0];
        self.label.textColor = [UIColor blackColor];
        self.label.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.label];
        
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon.png"]];
//        imageView.frame = CGRectMake(0, CGRectGetMaxY(self.label.frame), W, W);
//        [self.contentView addSubview:imageView];
        
//        self.contentView.layer.borderWidth = 1.0f;
//        self.contentView.layer.borderColor = [UIColor blackColor].CGColor;

    }
    
    return self;
}
@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.label = [[UILabel alloc] initWithFrame:self.bounds];
        self.label.backgroundColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont boldSystemFontOfSize:12.0];
        self.label.textColor = [UIColor blackColor];
        self.label.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.label];
    }
    return self;
}

@end

@implementation FooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        //collectionView footerView 会偏移一个单位
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
        self.label.backgroundColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont boldSystemFontOfSize:12.0];
        self.label.textColor = [UIColor blackColor];
        self.label.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.label];
    }
    return self;
}

@end
