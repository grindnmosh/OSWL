//
//  SecondViewController.h
//  Warren_Robert_MUX_1401
//
//  Created by Robert Warren on 1/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavingWishes.h"

@interface SecondViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>
{
    SavingWishes *optSingleton;
    UIImage *image;
    UITextField *activeField;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *prodName;
@property (strong, nonatomic) IBOutlet UITextField *prodDescrip;
@property (strong, nonatomic) IBOutlet UITextField *prodUrl1;
@property (strong, nonatomic) IBOutlet UITextField *prodURL2;
@property (strong, nonatomic) IBOutlet UITextField *prodPhone;
-(IBAction)onClick:(UIButton*)button;

@end
