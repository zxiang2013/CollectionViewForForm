//
//  ZXCollectionView.m
//  ChartDemo
//
//  Created by zengxiang on 16/9/2.
//  Copyright © 2016年 haowu. All rights reserved.
//

#import "ZXCollectionView.h"
#import "flowLayout.h"
#import "CollectCell.h"

#define SCREEN [UIScreen mainScreen].bounds.size.width
#define HEADERVIEW  40
#define FOOTERVIEW  40
static NSString *cellIdent   = @"cellIdent";
static NSString *headerIdent = @"headerIdent";
static NSString *footerIdent = @"footerIdent";

@interface ZXCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    CGFloat _height;
}
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) NSMutableArray *itemArr; //存储item数据的数组

@end
@implementation ZXCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame itemArray:(NSMutableArray *)itemArray {
    self.backgroundColor = [UIColor redColor];
    self = [super initWithFrame:frame];
    if (self) {
        self.itemArr = itemArray;
        [self loadCollection];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    //刷新frame
    CGRect rect = _collection.frame;
    rect.size.height = _height;
    _collection.frame = rect;

    //横竖屏
    UIInterfaceOrientation oritation = [[UIApplication sharedApplication] statusBarOrientation];
    if (oritation == UIInterfaceOrientationPortrait || oritation == UIInterfaceOrientationPortraitUpsideDown) {
        [self setPotraitFlowlayout];
    }else {
        [self setLandscapeFlowlayout];
    }
}

- (NSMutableArray *)itemArr {
    if (!_itemArr) {
        _itemArr = [NSMutableArray new];
    }
    return _itemArr;
}

- (void)loadCollection {
    if (!_collection) {
        self.collection = ({
            flowLayout *layout = [[flowLayout alloc] initWithFrame:self.bounds column:5];
            CGFloat height = [layout collectionViewHeightWithItemCounts:self.itemArr.count];
            _height = height;
            UICollectionView *collection = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
            collection.delegate = self;
            collection.dataSource = self;
            [self addSubview:collection];
            collection.backgroundColor = [UIColor orangeColor];
            
            [collection registerClass:[CollectCell class] forCellWithReuseIdentifier:cellIdent];
            [collection registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdent];
            [collection registerClass:[FooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerIdent];

            collection;
        });
    }
}

//返回高度
- (CGFloat)height {
    if (_headerViewTitle.length) _height += HEADERVIEW;
    if (_footerViewTitle.length) _height += FOOTERVIEW;
    return _height;
}

//设置竖屏视图
- (void)setPotraitFlowlayout {
    
}

//设置横屏视图
- (void)setLandscapeFlowlayout {
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemArr.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerIdent forIndexPath:indexPath];
        view.label.text = _headerViewTitle;
        return view;
        
    }else if (kind == UICollectionElementKindSectionFooter) {
        FooterView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerIdent forIndexPath:indexPath];
        view.label.text = _footerViewTitle;
        return view;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return (CGSize){CGRectGetWidth(self.bounds),_headerViewTitle.length ? HEADERVIEW:0};
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return (CGSize){CGRectGetWidth(self.bounds),_footerViewTitle.length ? FOOTERVIEW:0};
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdent forIndexPath:indexPath];
    //设置颜色以显示背景色（可以当辅助线条显示）
    cell.backgroundColor = [UIColor whiteColor];
    cell.label.text = self.itemArr[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //注意0的位置
    NSLog(@"----%zd",indexPath.item);
}
@end
