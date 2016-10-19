//
//  clothModel.h
//  瀑布流
//
//  Created by 潘金强 on 16/5/9.
//  Copyright © 2016年 潘金强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface clothModel : NSObject
@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *price;
@property(nonatomic,assign)NSInteger height;
@property(nonatomic,assign)NSInteger width;
-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)modelWithDic:(NSDictionary *)dic;
@end
