//
//  WishObject.h
//  MUX(1401)_Warren_Robert_ver2
//
//  Created by Robert Warren on 2/21/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WishObject : NSObject
{
    NSMutableArray *wishList;
    
    NSString *itemName;
    
    UIImage *itemImage;
    
    NSString *itemImageR;
    
    NSString *itemDetail;
    
    NSString *itemLink;
    
    NSString *directLink;
    
    NSString *phNumber;
}

-(id)initWithWish:(NSString*)title image:(UIImage *)image descrip:(NSString*)descrip itemURL:(NSString*)itemURL directURL:(NSString*)directURL phone:(NSString*)phone;

-(id)initWithRecall:(NSString*)title image:(NSString *)image descrip:(NSString*)descrip itemURL:(NSString*)itemURL directURL:(NSString*)directURL phone:(NSString*)phone;

@property(nonatomic, strong) NSString *itemName;

@property(nonatomic, strong) UIImage *itemImage;

@property(nonatomic, strong)  NSString *itemLink;

@property(nonatomic, strong)  NSString *directLink;

@property(nonatomic, strong)  NSString *phNumber;

@property(nonatomic, strong)  NSString *itemDetail;

@property(nonatomic, strong)  NSString *itemImageR;

//database builder static
+(WishObject*)sharedDataArray;

@property (nonatomic, strong) NSMutableArray *wishList;


@end
