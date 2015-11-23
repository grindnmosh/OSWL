 //
//  ViewController.m
//  MUX(1401)_Warren_Robert_ver2
//
//  Created by Robert Warren on 1/16/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "ViewController.h"
#import "ItemViewController.h"
#import "SecondViewController.h"
#import "WishObject.h"


@interface ViewController ()
{
    WishObject *toInsertName;
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    //singleton calls
    optSingleton = [SavingWishes singleOBJ];
    
    //swipe gesture
    rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [swiper addGestureRecognizer:rightSwipe];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (defaults != nil);
    {
        namedWish = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedName"] mutableCopy];
        imgWish = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedImage"] mutableCopy];
        detailWish = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedDescrip"] mutableCopy];
        urlWish = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedLink"] mutableCopy];
        url2Wish = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedLink2"] mutableCopy];
        phoneWish = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"filedPhone"] mutableCopy];
        
        for (int i = 0; i < [namedWish count]; i++)
        {
            itemName = [namedWish objectAtIndex:i];
            //itemImageR = [imgWish objectAtIndex:i];
            itemImage = [UIImage imageWithContentsOfFile:[imgWish objectAtIndex:i]];
            //itemImage = [UIImage imageNamed:itemImageR];
            description = [detailWish objectAtIndex:i];
            url = [ urlWish objectAtIndex:i];
            url2 = [ url2Wish objectAtIndex:i];
            ph = [phoneWish objectAtIndex:i];
            NSLog(@"%@", itemName);
            
            if (itemName != nil)
            {
                WishObject *load = [[WishObject alloc] initWithWish:itemName image:itemImage descrip:description itemURL:url directURL:url2 phone:ph];
                WishObject *database = [WishObject sharedDataArray];
                list = database.wishList;
                if (list != nil)
                {
                    [list addObject:load];
                }
                listArray = [WishObject sharedDataArray];
                
            }
        }
        [_onChart reloadData];
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
                  ^{
                      
                      
                  });
    //check for previous data
    
    
        //set row height
    self->_onChart.rowHeight = 60.0f;
    
    //set editing to off on load
    [_onChart setEditing:false animated:true];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    
    //singleton data from EventsViewController
    NSString *itemNamed = [optSingleton itemName];
    UIImage *itemImg = [optSingleton itemImage];
    NSString *itemDescrip = [optSingleton itemDescrip];
    NSString *url1 = [optSingleton url1];
    NSString *url_2 = [optSingleton url2];
    NSString *itemPhone = [optSingleton itemPhone];
    
    if (itemNamed != nil)
    {
        WishObject *load = [[WishObject alloc] initWithWish:itemNamed image:itemImg descrip:itemDescrip itemURL:url1 directURL:url_2 phone:itemPhone];
        WishObject *database = [WishObject sharedDataArray];
        list = database.wishList;
        if (list != nil)
        {
            [list addObject:load];
        }
        listArray = [WishObject sharedDataArray];
        [_onChart reloadData];
    }
    
    
    optSingleton.itemName = nil;
    optSingleton.itemImage = nil;
    optSingleton.itemDescrip = nil;
    optSingleton.url1 = nil;
    optSingleton.url2 = nil;
    optSingleton.itemPhone = nil;
    
    
    [_onChart reloadData];
    if ([listArray wishList] != nil) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if (defaults != nil)
        {
            int im = 0;
            continuous1 =[[NSMutableArray alloc] init];
            continuous2 =[[NSMutableArray alloc] init];
            continuous3 =[[NSMutableArray alloc] init];
            continuous4 =[[NSMutableArray alloc] init];
            continuous5 =[[NSMutableArray alloc] init];
            continuous6 =[[NSMutableArray alloc] init];
            for (int i =0; i < [listArray.wishList count]; i++)
            {
                
                UIImage *image = [[listArray.wishList objectAtIndex:i] itemImage];
                NSData *imageData = UIImagePNGRepresentation(image);
                NSString *imageName = [NSString stringWithFormat:@"/imageName%d.png", im];
                NSString *load2 = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:imageName];
                [imageData writeToFile:load2 atomically:YES];
                NSString *load1 = [[listArray.wishList objectAtIndex:i] itemName];
                NSString *load3 = [[listArray.wishList objectAtIndex:i] itemDetail];
                NSString *load4 = [[listArray.wishList objectAtIndex:i] itemLink];
                NSString *load5 = [[listArray.wishList objectAtIndex:i] directLink];
                NSString *load6 = [[listArray.wishList objectAtIndex:i] phNumber];
                im++;
                if (listArray.wishList != nil)
                {
                    [continuous1 addObject:load1];
                    [continuous2 addObject:load2];
                    [continuous3 addObject:load3];
                    [continuous4 addObject:load4];
                    [continuous5 addObject:load5];
                    [continuous6 addObject:load6];
                }
            }
            
            [[NSUserDefaults standardUserDefaults]setObject:continuous1 forKey:@"filedName"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous2 forKey:@"filedImage"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous3 forKey:@"filedDescrip"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous4 forKey:@"filedLink"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous5 forKey:@"filedLink2"];
            [[NSUserDefaults standardUserDefaults]setObject:continuous6 forKey:@"filedPhone"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }

     }
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//set number of labels based on title array size.
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    listArray = [WishObject sharedDataArray];
    return [listArray.wishList count];
}

//commit to the delete here.
-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //verify editing style
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //remove object from UI
        [listArray.wishList removeObjectAtIndex:indexPath.section];
        
        
        //remove from arrays
        [_onChart deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [_onChart reloadData];
    }
}

//create tags and insert data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //create tags
    static NSString *cellId = @"Test";
    UITableViewCell *wishCell = [_onChart dequeueReusableCellWithIdentifier: cellId];
    if (wishCell == nil)
    {
        wishCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        [wishCell.textLabel setNumberOfLines:6];
        wishCell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    //add image to label
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 60, 50)];
    UIImage *imageName = [[listArray.wishList objectAtIndex:indexPath.row] itemImage];
    imv.image = imageName;
    [wishCell.contentView addSubview:imv];
    wishCell.textLabel.text = [NSString stringWithFormat:@"%@", [[listArray.wishList objectAtIndex:indexPath.row] itemName]];
    //return label
    return wishCell;
    
}

//universal segue call to pass the custom data to detail page
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"])
    {
        ItemViewController *destination = segue.destinationViewController;
        destination.insertName = toInsertName;
    }
}

//selected row calls
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    toInsertName = [listArray.wishList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier: @"detail" sender: self];

}

-(void)onSwipe:(UISwipeGestureRecognizer *)recognized
{
    [self performSegueWithIdentifier: @"newness" sender: self];
}


-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        //share
        UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:continuous1 applicationActivities:nil];
        [self presentViewController:controller animated:YES completion:nil];
    }
    else if (button.tag == 1)
    {
        //close
        if (!_onChart.editing)
        {
            [_onChart setEditing:true animated:true];
            [button setTitle:@"Done" forState:UIControlStateNormal];
        }
        else
        {
            [_onChart setEditing:false animated:true];
            [button setTitle:@"Edit List" forState:UIControlStateNormal];
        }
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
