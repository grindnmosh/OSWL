//
//  SavingWishes.h
//  MUX(1401)_Warren_Robert_ver2
//
//  Created by Robert Warren on 1/18/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavingWishes : NSObject
{
    NSString *itemName;
    UIImage *itemImage;
    NSString *itemDescrip;
    NSString *url1;
    NSString *url2;
    NSString *itemPhone;
}


@property(nonatomic)NSString *itemName;
@property(nonatomic)UIImage *itemImage;
@property(nonatomic)NSString *itemDescrip;
@property(nonatomic)NSString *url1;
@property(nonatomic)NSString *url2;
@property(nonatomic)NSString *itemPhone;

+(SavingWishes *) singleOBJ;
@end
