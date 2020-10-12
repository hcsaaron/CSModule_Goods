//
//  CSGoodsManager.h
//  CSModule_Goods
//
//  Created by hcs on 2020/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSGoodsManager : NSObject

+ (instancetype)defaultManager;

- (NSString *)goodsNameForGoodsId:(NSString *)goodsId;
@end

NS_ASSUME_NONNULL_END
