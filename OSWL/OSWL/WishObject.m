//
//  WishObject.m
//  MUX(1401)_Warren_Robert_ver2
//
//  Created by Robert Warren on 2/21/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "WishObject.h"

@implementation WishObject
@synthesize itemName, itemDetail, itemImage, itemLink, directLink, phNumber, wishList, itemImageR;

-(id)initWithWish:(NSString*)title image:(UIImage *)image descrip:(NSString*)descrip itemURL:(NSString*)itemURL directURL:(NSString*)directURL phone:(NSString*)phone
{
    if ((self = [super init]))
    {
        itemName = title;
        itemImage = image;
        itemDetail = descrip;
        itemLink = itemURL;
        directLink = directURL;
        phNumber = phone;
    }
    return self;
}

-(id)initWithRecall:(NSString*)title image:(NSString *)image descrip:(NSString*)descrip itemURL:(NSString*)itemURL directURL:(NSString*)directURL phone:(NSString*)phone
{
    if ((self = [super init]))
    {
        itemName = title;
        itemImageR = image;
        itemDetail = descrip;
        itemLink = itemURL;
        directLink = directURL;
        phNumber = phone;
        
    }
    return self;
}

//database builder
static WishObject* _sharedDataArray = nil;
+(WishObject*)sharedDataArray
{
    if (!_sharedDataArray)
    {
        _sharedDataArray = [[self alloc] init];
    }
    return _sharedDataArray;
}

//database
-(id)init
{
    if ((self = [super init]))
    {
        wishList = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
