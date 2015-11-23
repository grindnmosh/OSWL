//
//  ViewController.h
//  MUX(1401)_Warren_Robert_ver2
//
//  Created by Robert Warren on 1/16/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavingWishes.h"
#import "SecondViewController.h"
#import "WishObject.h"
#import <iAd/iAd.h>

@interface ViewController : UIViewController <ADBannerViewDelegate>
{
    SavingWishes *optSingleton;
    WishObject *listArray;
    WishObject *loaded;
    NSMutableArray *savedWishes;
    NSString *itemName;
    UIImage *itemImage;
    NSString *itemImageR;
    NSString *description;
    NSString *url;
    NSString *url2;
    NSString *ph;
    
    NSMutableArray *list;
    NSMutableArray *namedWish;
    NSMutableArray *imgWish;
    NSMutableArray *detailWish;
    NSMutableArray *urlWish;
    NSMutableArray *url2Wish;
    NSMutableArray *phoneWish;
    NSMutableArray *name;
    NSMutableArray *continuous1;
    NSMutableArray *continuous2;
    NSMutableArray *continuous3;
    NSMutableArray *continuous4;
    NSMutableArray *continuous5;
    NSMutableArray *continuous6;
    
    NSString *theName;
    NSString *wishName;
    IBOutlet UILabel *swiper;
    UISwipeGestureRecognizer *rightSwipe;
}
@property (weak, nonatomic) IBOutlet UITableView *onChart;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

-(IBAction)onClick:(UIButton*)button;
-(void)onSwipe:(UISwipeGestureRecognizer*)recognized;

@end
