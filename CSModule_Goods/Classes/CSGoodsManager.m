//
//  CSGoodsManager.m
//  CSModule_Goods
//
//  Created by hcs on 2020/10/12.
//

#import "CSGoodsManager.h"

@implementation CSGoodsManager

+ (instancetype)defaultManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSString *)goodsNameForGoodsId:(NSString *)goodsId {
    return [NSString stringWithFormat:@"商品_%@", goodsId];
}

@end
