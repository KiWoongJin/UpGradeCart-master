//
//  Product.m
//  CartTable
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Product.h"

@implementation Product

+ (id)product:(NSString *)name code:(NSString *)code price:(NSString *)price image:(NSString *)image{
    Product *item = [[Product alloc]init];
    item.code = code;
    item.name = name;
    item.price = price;
    item.imageName = image;
    
    return item;
}

- (BOOL)isEqualProduct:(NSString *)productCode{
    return [self.code isEqualToString:productCode];
}
@end
