//
//  ViewController.m
//  Ex1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Catalog.h"
#import "Product.h"
#import "ProductCell.h"
#import "Cart.h"
#import "CartCell.h"
#import "CartItem.h"
#import "ProductDetailViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CartDelegate>

@property NSMutableArray *items;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart *cart;

@end

@implementation ViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ProductDetailViewController *detailVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *selectedProduct = [[Catalog defalutCatalog] productAt:indexPath.row];
    
    detailVC.productCode = selectedProduct.code;
    
    
}

- (void) addItem:(id)sender
{
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defalutCatalog]productAt:indexPath.row];
    [self.cart addProduct:product];
    //핵심
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(0==section)
    {
        return [[Catalog defalutCatalog] numberOfProducts];
    }
    
    else
        return self.cart.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(0==indexPath.section)
    {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        cell.delegate=self;
        Product *product = [[Catalog defalutCatalog]productAt:indexPath.row];
        [cell setProductInfo:product];
        return cell;
    }
    
    else
    {
        CartCell *cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        cell.delegate= self;
        CartItem *cartItem = self.cart.items[indexPath.row];
      
        [cell setCartItem:cartItem];
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(0==section)
        return @"Product";
    else
        return @"Item in Cart";
}

- (void)incQuantity:(NSString *)productCode{
    
    [self.cart incQuantity:productCode];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)decQuantity:(NSString *)productCode
{
    [self.cart decQunatity:productCode];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.cart = [[Cart alloc]init];
    self.cart.items= [[NSMutableArray alloc]init];
    
    self.navigationController.navigationBarHidden=YES;
 
}

- (void)viewWillAppear:(BOOL)animated
{
    
    self.navigationController.navigationBarHidden=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
