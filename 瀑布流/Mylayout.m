//
//  Mylayout.m
//  瀑布流
//
//  Created by 潘金强 on 16/5/9.
//  Copyright © 2016年 潘金强. All rights reserved.
//

#import "Mylayout.h"
#import "clothModel.h"
@interface Mylayout()
@property (nonatomic,strong)NSMutableArray *lastYarr;
@property (nonatomic,strong)NSArray *layoutAttribute;
@end
@implementation Mylayout

-(NSMutableArray *)lastYarr{
    if(_lastYarr==nil) {
        _lastYarr=[NSMutableArray array];
        for(int i=0;i<self.colNum;i++){
            [_lastYarr addObject:@(self.margin)];
        }
          }
     return _lastYarr;
}
-(void)prepareLayout{
    [super prepareLayout];
    
     NSLog(@"%lu",(unsigned long)self.info.count);
    
    NSMutableArray *mu=[NSMutableArray  array];
    self.lastYarr=nil;
    CGFloat cellW=([UIScreen mainScreen].bounds.size.width-self.margin*(self.colNum+1))/self.colNum;
    for(int i=0;i<self.info.count;i++){
        
        NSIndexPath *index=[NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attribute=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        
        clothModel *model=self.info[i];
               //列数
        NSInteger col=i%self.colNum;
        
        
        
        
        CGFloat cellX=self.margin + (self.margin+cellW)*col;
        
        CGFloat cellH=model.height*cellW/model.width;
        
        
        CGFloat lastY=[self.lastYarr[col]floatValue];
        
        
        CGFloat  cellY=lastY;
        
        
        self.lastYarr[col]=@(lastY+self.margin+cellH);
        
        attribute.frame=CGRectMake(cellX, cellY, cellW, cellH);
    
        [mu addObject:attribute];
}

    
        CGFloat maxY=0;
    
        NSIndexPath *footIndex=[NSIndexPath indexPathForItem:0 inSection:0];
    
        UICollectionViewLayoutAttributes *footView=[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:footIndex];
    
        for(int i=0;i<self.lastYarr.count;i++){
            CGFloat currentY=[self.lastYarr[i]floatValue];
            
            if(currentY>maxY){
                maxY=currentY;}}
            footView.frame=CGRectMake(0, maxY, [UIScreen mainScreen].bounds.size.width,50);
            [mu  addObject:footView];
    

    self.layoutAttribute=mu;

          
        }
        
        
        

    
    
    

-(CGSize)collectionViewContentSize{
   // return [super collectionViewContentSize];
    UICollectionViewLayoutAttributes *att=self.layoutAttribute.lastObject;
    CGFloat maxY=CGRectGetMaxY(att.frame)+self.margin;

    return CGSizeMake([UIScreen mainScreen].bounds.size.width, maxY);
    
    
    
    
    
}
//-(NSArray<UICollectionViewLayoutAttributes *>*)layoutAttributeAtIndexes:(NSIndexSet *)indexes{
//    NSLog(@"%@",self.layoutAttribute);
//    return self.layoutAttribute;
//    
//}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
        return self.layoutAttribute;
    }

//@end
// 布局数组
//@property(strong,nonatomic) NSArray *layoutAttributes;
//
//// 上一行的Y坐标
//@property(strong,nonatomic) NSMutableArray *lastRowY;
//
//
//// 上一行的Y坐标
//
//
//@end
//
//@implementation Mylayout
//
//#pragma mark - 初始化数组 重写getLastRowY方法
//- (NSMutableArray *)lastRowY{
//    if (_lastRowY == nil) {
//        _lastRowY =[NSMutableArray array];
//        
//        // 每一行 有几列 就创建几个对象 即可
//        for (int i = 0; i<self.colNum; i++) {
//            [_lastRowY addObject:@(self.margin)];
//        }
//    }
//    return _lastRowY;
//}
//
//// 计算布局属性 布局数组计算完毕
//- (void)prepareLayout{
//    [super prepareLayout];
//    // 计算必须的变量
//    CGFloat cellW = ([UIScreen mainScreen].bounds.size.width - self.margin * (self.colNum + 1))/self.colNum;
//    
//    // 创建可变数组
//    NSMutableArray *mutArr = [NSMutableArray array];
//    
//#warning 清空 上一行Y的 数组 中的内容 还原为 10 10 10
//    self.lastRowY = nil;
//    
//    // 循环 去创建布局对象 cell的布局对象-----------------
//    for (int i = 0; i<self.clothInfos.count; i++) {
//        // 创建indexPath
//        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//        // 创建布局对象
//        UICollectionViewLayoutAttributes *cellAttr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//        
//        // 获取model 用来计算高度
//      clothModel *model = self.clothInfos[i];
//        
//        // 计算行号 列号
//        NSInteger numsOfCol = i % self.colNum;
//        NSInteger numsOfRow = i / self.colNum;
//        
//        // 计算Frame
//        
//        CGFloat cellH  = model.height * cellW / model.width;
//        NSLog(@"%f",cellH);
//        
//        CGFloat cellX = self.margin  + (self.margin + cellW) * numsOfCol;
//        
//#warning 取出 上一行 数组 的对应行的 y坐标
//        // 获取 保存的值
//        CGFloat lastRowY = [self.lastRowY[numsOfCol]floatValue];
//        
//        CGFloat cellY = lastRowY;
//        // 重新计算当前行的Y最大值,加上 间距 并且赋值回去
//        self.lastRowY[numsOfCol] = @(lastRowY + self.margin + cellH);
//        
//        
//        // 设置frame
//        cellAttr.frame = CGRectMake(cellX, cellY, cellW, cellH);
//        
//        // 添加到一个数组中
//        [mutArr addObject:cellAttr];
//    }
//    
//    // 计算 底部视图的布局对象
//    
//    // 定义变量 用来记录 最大的Y坐标
//    CGFloat maxY = 0;
//    
//    // 获取 最大的Y 在lastRowY数组中
//    for (int i = 0; i<self.lastRowY.count; i++) {
//        // 取出元素
//        CGFloat currentY = [self.lastRowY[i]floatValue];
//        if (currentY>maxY) {
//            maxY = currentY;
//        }
//    }
//    
//    // maxY 就是 当前最大的Y
//    
//    CGFloat footW = [UIScreen mainScreen].bounds.size.width;
//    CGFloat footH = 50;
//    CGFloat footX = 0;
//    CGFloat footY = maxY;
//    
//    // 创建 footView的 布局对象
//    NSIndexPath *footIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
//    UICollectionViewLayoutAttributes *footAttr = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:footIndexPath];
//    // 计算Frame
//    footAttr.frame = CGRectMake(footX, footY, footW, footH);
//    
//    // 添加到可变数组
//    [mutArr addObject:footAttr];
//    
//    // 赋值给 属性
//    self.layoutAttributes = mutArr;
//}
//
//// 计算内容的大小 根据布局数组 去计算 内容区域
//- (CGSize)collectionViewContentSize{
//    
//    // 直接 获取 数组的 最后一个元素 的Y最大值
//    UICollectionViewLayoutAttributes *lastAttr = self.layoutAttributes.lastObject;
//    
//    CGFloat maxY = CGRectGetMaxY(lastAttr.frame) + self.margin;
//    
//    return  CGSizeMake([UIScreen mainScreen].bounds.size.width, maxY);
//}
//
//// 返回 布局对象数组
//- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
//    return self.layoutAttributes;
//}

@end

