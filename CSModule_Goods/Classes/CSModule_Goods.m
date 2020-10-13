//
//  CSModule_Goods.m
//  CSModule_Goods
//
//  Created by hcs on 2020/10/13.
//

#import "CSModule_Goods.h"
#import "CSGoodsManager.h"
#import "CSGoodsDetailViewController.h"

@implementation CSModule_Goods

+ (void)load {
    [CSModuleManager registClass:self forProtocol:@protocol(CSGoodsProtocol)];
}

+ (UIImage *)imageNamed:(NSString *)imageName {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *url = [bundle URLForResource:@"CSModule_Goods" withExtension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL:url];
    UIImage *image = [UIImage imageNamed:imageName inBundle:resourceBundle compatibleWithTraitCollection:nil];
    return image;
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
