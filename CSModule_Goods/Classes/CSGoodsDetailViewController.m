//
//  CSGoodsDetailViewController.m
//  CSModule_Goods
//
//  Created by hcs on 2020/10/12.
//

#import "CSGoodsDetailViewController.h"
#import <CSModule/CSModule.h>
#import "CSGoodsManager.h"
#import <Masonry/Masonry.h>

@interface CSGoodsDetailViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *goodsNameLabel;
@end

@implementation CSGoodsDetailViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[CSModule_Goods imageNamed:@"nav_cart"] style:UIBarButtonItemStylePlain target:self action:@selector(cartButtonClicked:)];
    
    [self setupUI];
    
    [self setupData];
}

- (void)setupUI {
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        
        UIView *tableHeaderView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
            _goodsNameLabel = ({
                UILabel *label = [[UILabel alloc] init];
                label.font = [UIFont boldSystemFontOfSize:18];
                label;
            });
            [view addSubview:_goodsNameLabel];
            [_goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.mas_equalTo(0).inset(20);
            }];
            view;
        });
        
        tableView.tableHeaderView = tableHeaderView;
        tableView.tableFooterView = [[UIView alloc] init];
        
        tableView;
    });
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)setupData {
    
    if (!self.goodsId) {
        return;
    }
    
    NSString *goodsName = [[CSGoodsManager defaultManager] goodsNameForGoodsId:self.goodsId];
    _goodsNameLabel.text = goodsName;
}

#pragma mark - private

#pragma mark - action
- (void)cartButtonClicked:(UIButton *)button {
    // 调用"购物车组件"获取购物车详情页
    id<CSCartProtocol> cartApi = [CSModuleManager instanceForProtocol:@protocol(CSCartProtocol)];
    UIViewController *cartVC = [cartApi createCartViewController];
    [self.navigationController pushViewController:cartVC animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
