//
//  Cart.h
//  UpGradeCart
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartItem.h"
#import "Product.h"

@interface Cart : NSObject
@property NSMutableArray *items;
- (void)addProduct:(Product *)item;

- (void)incQuantity1:(NSString *)productCode;
- (void)decQuantity1:(NSString *)productCode;
- (CartItem *)cartItemWith:(NSString *)productCode;

@end
