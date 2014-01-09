//
//  ViewController.m
//  UpGradeCart
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "CartDelegate.h"
#import "Catalog.h"
#import "CartCell.h"
#import "Cart.h"
#import "CartItem.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *cartItems;
@property (strong, nonatomic) Cart *cart;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController
- (void)incQuantity:(NSString *)productCode{
    [self.cart incQuantity1:productCode];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)decQuantity:(NSString *)productCode{
    [self.cart decQuantity1:productCode];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (void)addItem:(id)sender{
    
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog]productAt:indexPath.row];
    
    
    [self.cart addProduct:product];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(0 == section)
        return [[Catalog defaultCatalog]numberOfProducts];
    else
        return self.cart.items.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return (0 == section)?@"상품목록" : @"카트";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        Product *product = [[Catalog defaultCatalog]productAt:indexPath.row];
        [cell setProductInfo:product];
        
        cell.delegate = self;
        return cell;
    }
    else{
        CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        
        cell.delegate = self;
        CartItem *cartitem = self.cart.items[indexPath.row];
        [cell setCartItem:cartitem];
        
        return cell;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.cart = [[Cart alloc]init];
    self.cart.items = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end