//
//  Mylayout.h
//  瀑布流
//
//  Created by 潘金强 on 16/5/9.
//  Copyright © 2016年 潘金强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mylayout : UICollectionViewFlowLayout
@property (nonatomic,assign)NSInteger colNum;
@property (nonatomic,strong)NSArray *info;
@property(nonatomic,assign)CGFloat margin;


// 列数


// 将数组 给瀑布流对象
@property(strong,nonatomic) NSArray *clothInfos;

@end
