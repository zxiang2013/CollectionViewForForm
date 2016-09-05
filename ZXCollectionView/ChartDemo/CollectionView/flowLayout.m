//
//  flowLayout.m
//  ChartDemo
//
//  Created by zengxiang on 16/9/2.
//  Copyright © 2016年 haowu. All rights reserved.
//

#import "flowLayout.h"

#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.3

static CGFloat const W = 100;//item宽度;
static CGFloat const H = 30;//item高度;
static CGFloat const P = 1; //间距
static CGFloat const xP = 1; //左右间距
//static CGFloat const column = 10; //默认列数
@implementation flowLayout
{
    CGFloat _width;
    NSInteger _column;
}

- (instancetype)initWithFrame:(CGRect)frame column:(NSInteger)column {
    if (self == [super init]) {
        _width = frame.size.width;
        _column = column;

        self.minimumLineSpacing = P;
        self.minimumInteritemSpacing = P;
        self.itemSize = (CGSize){[self widthWithColumn:column],H};
        self.sectionInset = UIEdgeInsetsMake(1, xP, 0, xP);
    }
    return self;
}

//PS:计算的时候默认左右边距为1，这样可以显示边线


//固定宽度和间距，左右间距为0，求列数
- (NSInteger)columnWithPadding:(CGFloat)padding {
    NSInteger column;
    column = (_width - padding*2 + P)/(W+P);
    return column;
}

//固定列数和间距和宽度，求左右间距
- (CGFloat)paddingWithColumn:(NSInteger)column {
    CGFloat padding = 0;
    padding = (_width - column*W - (column - 1)*P)/2;
    return padding;
}

//固定列数和间距，左右宽度为0，求宽度
- (CGFloat)widthWithColumn:(NSInteger)column {
    CGFloat width = 0;
    width = (_width - (column - 1)*P - xP * 2)/column;
    return width;
}

- (CGFloat)collectionViewHeightWithItemCounts:(NSInteger)counts {
    CGFloat height = 0;
    NSInteger row = counts / _column;
    height = row*H + (row + 1)*P;
    return height;
}
/*
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes* attributes in array) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
            if (ABS(distance) < ACTIVE_DISTANCE) {
                CGFloat zoom = 1 + ZOOM_FACTOR*(1 - ABS(normalizedDistance));
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attributes.zIndex = 1;
            }
        }
    }
    return array;
}


- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
    
    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}
*/
@end
