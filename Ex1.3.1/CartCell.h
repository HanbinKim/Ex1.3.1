//
//  CartCell.h
//  Ex1.3.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartDelegate.h"
#import "CartItem.h"



@interface CartCell : UITableViewCell


- (void)setCartItem:(CartItem *)item;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
@property (weak, nonatomic)id<CartDelegate> delegate;





@end
