//
//  ViewController.m
//  ChartDemo
//
//  Created by zengxiang on 16/9/2.
//  Copyright © 2016年 haowu. All rights reserved.
//

#import "ViewController.h"
#import "flowLayout.h"
#import "CollectCell.h"
#import "ZXCollectionView.h"

#define wi  60*4+3
#define pad [UIScreen mainScreen].bounds.size.width
static NSString *cellIdent = @"cellIdent";

@interface ViewController ()

@property (nonatomic ,strong) UILabel *label;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.navigationController.viewControllers.count > 1) {
        
        [self loadCollection];
        if (self.navigationItem.rightBarButtonItem) {
            self.navigationItem.rightBarButtonItem.enabled = NO;
        }
        self.label.hidden = YES;
        
    }else {
        if (self.navigationItem.rightBarButtonItem) {
            self.navigationItem.rightBarButtonItem.enabled = YES;
        }
        self.label.hidden = NO;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(push)];
    self.navigationItem.rightBarButtonItem = item;
    
    self.label.frame = CGRectMake(100, 100, 100, 100);
    self.label.center = self.view.center;
    [_label sizeToFit];

}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"点击右上角+按钮";
        [self.view addSubview:_label];
    }
    return _label;
}

- (void)push {
    ViewController *view = [[ViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}
- (void)loadCollection {
    self.navigationItem.title = @"表格";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CGRect rect = CGRectMake(20, 100, pad - 40, 100);
    
    /**
     数据填写方式：
            首行：标题
            以下数据按格式一组一组排列
     这样获取点击事件需要算法支持，不过一般表格都不用点击
     */
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"姓名",@"行业",@"昵称",@"电话号码",@"性别",
                                                           @"1",@"1",@"1",@"1",@"1",
                                                           @"1",@"1",@"1",@"1",@"1",
                                                           @"1",@"1",@"1",@"1",@"1",
                                                           @"1",@"1",@"1",@"1",@"1",
                                                           @"1",@"1",@"1",@"1",@"1",
                                                           @"1",@"1",@"1",@"1",@"1",
                                                           @"1",@"1",@"1",@"1",@"1",
                                                           @"1",@"1",@"1",@"1",@"1",]];
    ZXCollectionView *collect = [[ZXCollectionView alloc] initWithFrame:rect itemArray:arr];
    collect.headerViewTitle = @"2016 APPLE DEVELOPMENT HEADER";
    collect.footerViewTitle = @"2016 APPLE DEVELOPMENT FOOTER";
    CGFloat height = [collect height];
    CGRect r = collect.frame;
    r.size.height = height;
    collect.frame = r;
    [self.view addSubview:collect];
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
