//
//  CSGoodsProImp.m
//  CSModule_Goods
//
//  Created by hcs on 2020/10/12.
//

#import "CSGoodsProImp.h"
#import "CSGoodsManager.h"
#import "CSGoodsDetailViewController.h"

@implementation CSGoodsProImp
+ (void)load {
    [CSModuleManager registClass:self forProtocol:@protocol(CSGoodsProtocol)];
}

#pragma mark - CSGoodsProtocol
- (NSString *)goodsNameForGoodsId:(NSString *)goodsId {
    return [[CSGoodsManager defaultManager] goodsNameForGoodsId:goodsId];
}

- (UIViewController *)crateGoodsViewControllerWithGoodsId:(NSString *)goodsId {
    CSGoodsDetailViewController *vc = [[CSGoodsDetailViewController alloc] init];
    vc.goodsId = goodsId;
    return vc;
}

@end
