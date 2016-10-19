//
//  clothCell.m
//  瀑布流/Users/panjinqiang/Desktop/瀑布流/瀑布流/CZmylayout.h
//
//  Created by 潘金强 on 16/5/9.
//  Copyright © 2016年 潘金强. All rights reserved.
//

#import "clothCell.h"
@interface clothCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
@implementation clothCell
-(void)setModel:(clothModel *)model{
    _iconImageView.image=[UIImage imageNamed:model.icon];
    _priceLabel.text=model.price;
}
@end
