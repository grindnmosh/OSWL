//
//  SavingWishes.m
//  MUX(1401)_Warren_Robert_ver2
//
//  Created by Robert Warren on 1/18/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "SavingWishes.h"

@implementation SavingWishes
{
    SavingWishes *anotherItem;
}

//singleton vars
@synthesize itemName, itemImage, itemDescrip, url1, url2, itemPhone;

//singleton static method
+(SavingWishes*)singleOBJ
{
    static SavingWishes *singleton = nil;
    @synchronized(self)
    {
        if (!singleton)
        {
            singleton = [[SavingWishes alloc] init];
        }
        return singleton;
    }
    
}

@end
