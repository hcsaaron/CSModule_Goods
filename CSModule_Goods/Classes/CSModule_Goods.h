//
//  CSModule_Goods.h
//  CSModule_Goods
//
//  Created by hcs on 2020/10/13.
//

#import <Foundation/Foundation.h>
#import <CSModule/CSModule.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSModule_Goods : NSObject<CSGoodsProtocol>

+ (UIImage *)imageNamed:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
