//
//  ViewController.m
//  瀑布流
//
//  Created by 潘金强 on 16/5/9.
//  Copyright © 2016年 潘金强. All rights reserved.
//

#import "ViewController.h"
#import "clothModel.h"
#import "clothCell.h"
#import "Mylayout.h"

@interface ViewController ()
@property (nonatomic,strong)NSMutableArray *clothinfoarr;
@property(nonatomic,assign)NSInteger index;

@property (weak, nonatomic) IBOutlet Mylayout *mylayout;

//@property (weak, nonatomic) IBOutlet Mylayout *mylayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.index=2;
    
    self.mylayout.colNum=3;
    self.mylayout.info=self.clothinfoarr;
    self.mylayout.margin=30;

//    // 列数

//    
    // 告诉他数据


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray *)clothinfoarr{
           if(_clothinfoarr==nil) {
            NSArray *dicarr=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"1.plist" ofType:nil]];
            NSMutableArray *mu=    [NSMutableArray array];
            for(NSDictionary *dic in dicarr){
             clothModel    *model = [clothModel modelWithDic:dic];
                [mu addObject:model];
            }
            _clothinfoarr=mu;
        }
        return _clothinfoarr;
    }
- (void)loadMore{
    NSInteger index=self.index%3+1;
    NSString *name=[NSString stringWithFormat:@"%01ld.plist",index];
    NSArray *dicarr=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:name ofType:nil]];
    for(NSDictionary *dic in dicarr) {
        clothModel *model=[clothModel modelWithDic:dic];
        [self.clothinfoarr addObject:model];
    }
    self.index++;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.clothinfoarr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    clothCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"key" forIndexPath:indexPath];
    clothModel *model=self.clothinfoarr[indexPath.item];
    cell.model=model;
    return cell;
}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSString *key=nil;
    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        key=@"foot";
    }
    else key=@"head";
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self loadMore];
    [self.collectionView reloadData];
});
    
    UICollectionReusableView *footView=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:key forIndexPath:indexPath];
    return footView;
    
}




















@end
