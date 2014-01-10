//
//  Catalog.m
//  Ex1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Catalog.h"

@implementation Catalog
{
    NSArray *data;
}

static Catalog *_instance = nil;
+ (id)defalutCatalog
{
    if(nil == _instance)
        _instance = [[Catalog alloc]init];
    return _instance;
    

    
}

- (Product *)productWithCode:(NSString *)productCode
{
    for(Product *one in data)
    {
        if([one isEqualProduct:productCode])
        {
            return one;
        }
    }
    return nil;
}

- (id)init
{
    self = [super init];
    if(self)
    {
            data=@[[Product product:@"car1" price:@"100" image:@"car1.png" code:@"1"]
                   ,[Product product:@"car2" price:@"200" image:@"car2.png" code:@"2"]
                   ,[Product product:@"car3" price:@"300" image:@"car3.png" code:@"3"]
                   ,[Product product:@"car4" price:@"400" image:@"car4.png" code:@"4"]
                   ,[Product product:@"car5" price:@"999" image:@"car5.png" code:@"5"]];
    }
    return self;
}

- (id) productAt:(int)index
{
    return [data objectAtIndex:index];
}

- (int)numberOfProducts
{
    return [data count];
}


@end
