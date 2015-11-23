//
//  ItemViewController.m
//  Warren_Robert_MUX_1401
//
//  Created by Robert Warren on 1/9/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ItemViewController.h"
#import "ViewController.h"
#import "WishObject.h"
#import "SVWebViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //swipe gesture
    leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [swiper addGestureRecognizer:leftSwipe];
    
    [super viewDidLoad];
    self.itemimg.image = _insertName.itemImage;
    //self.itemimg.frame = CGRectMake(8.0f, 103.0f, 200.0f, 150.0f);
    //Product Name
    self.name.text = _insertName.itemName;
    //Product Details
    self.descrip.text = _insertName.itemDetail;
    
    [self.url1 setTitle:_insertName.itemLink forState:UIControlStateNormal];
    [self.url2 setTitle:_insertName.directLink forState:UIControlStateNormal];
    self.phone.text = _insertName.phNumber;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onSwipe:(UISwipeGestureRecognizer *)recognized
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onClick:(UIButton*)button
{
    
    if (button.tag == 0)
    {
        NSMutableArray *itemArray = [[NSMutableArray alloc] initWithObjects:
                    _insertName.itemImage,
                    _insertName.itemName,
                    _insertName.itemDetail,
                    _insertName.itemLink,
                    _insertName.directLink,
                    _insertName.phNumber,
                    nil];
        NSLog(@"%@",itemArray);
       //share
        UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:itemArray applicationActivities:nil];
        [self presentViewController:controller animated:YES completion:nil];
    }
    else if (button.tag == 1)
    {
        //close
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (button.tag == 2)
    {
        SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:[NSString stringWithFormat:@"%@", _insertName.itemLink]];
        [self presentViewController:webViewController animated:YES completion:NULL];
    }
    else if (button.tag == 3)
    {
        SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:[NSString stringWithFormat:@"%@", _insertName.directLink]];
        [self presentViewController:webViewController animated:YES completion:NULL];
    }

}


-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:1];
    
    [UIView commitAnimations];
    
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
}


@end
