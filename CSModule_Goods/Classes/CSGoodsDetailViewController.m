//
//  CSGoodsDetailViewController.m
//  CSModule_Goods
//
//  Created by hcs on 2020/10/12.
//

#import "CSGoodsDetailViewController.h"
#import <CSModule/CSModule.h>
#import "CSGoodsManager.h"

@interface CSGoodsDetailViewController ()
@property (nonatomic, strong) UILabel *goodsLabel;
@property (nonatomic, strong) UILabel *cartLabel;
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
    
    if (!self.goodsId) {
        return;
    }
    
    _goodsLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:18];
        label;
    });

    _cartLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.layer.borderColor = [UIColor lightGrayColor].CGColor;
        label.layer.borderWidth = 1;
        label;
    });
    
    [self.view addSubview:_goodsLabel];
    [self.view addSubview:_cartLabel];
    
    NSString *goodsName = [[CSGoodsManager defaultManager] goodsNameForGoodsId:self.goodsId];
    _goodsLabel.text = goodsName;
    
    id<CSCartProtocol> api = [CSModuleManager instanceForProtocol:@protocol(CSCartProtocol)];
    NSUInteger goodsCount = [api countForGoodsId:self.goodsId];
    
    _cartLabel.text = [NSString stringWithFormat:@"%@数量: %ld", goodsName, goodsCount];
    
    [self.view setNeedsDisplay];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.goodsLabel sizeToFit];
    
    [self.cartLabel sizeToFit];
    
    CGRect cartRect = self.cartLabel.frame;
    cartRect.origin.x = self.view.frame.size.width - cartRect.size.width;
    cartRect.origin.y = self.view.frame.size.height - cartRect.size.height - 34;
    self.cartLabel.frame = cartRect;
}



@end
