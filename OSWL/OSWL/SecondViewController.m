//
//  SecondViewController.m
//  Warren_Robert_MUX_1401
//
//  Created by Robert Warren on 1/8/14.
//  Copyright (c) 2014 Robert Warren. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    //singleton calls
    optSingleton = [SavingWishes singleOBJ];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


#define kMin 150

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
    if (self.view.frame.origin.y + activeField.frame.origin. y >= kMin) {
        [self setViewMovedUp:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
    if (self.view.frame.origin.y < 0 ) {
        [self setViewMovedUp:NO];
    }
}

-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        rect.origin.y = kMin - activeField.frame.origin.y ;
    }
    else
    {
        rect.origin.y = 0;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

- (void)keyboardWillShow:(NSNotification *)notif
{
    
    if ([activeField isFirstResponder] && activeField.frame.origin.y + self.view.frame.origin.y >= kMin)
    {
        [self setViewMovedUp:YES];
    }
    else if (![activeField isFirstResponder] && activeField.frame.origin.y  + self.view.frame.origin.y < kMin)
    {
        [self setViewMovedUp:NO];
    }
}

- (void)keyboardWillHide:(NSNotification *)notif
{
    if (self.view.frame.origin.y < 0 ) {
        [self setViewMovedUp:NO];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [_imageView setImage:image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        if ([_prodName.text  isEqual: @""])
        {
            //missing info alert
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter Product Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else if ([_prodDescrip.text  isEqual: @""])
        {
            //missing info alert
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter Product Description" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else if ([_prodUrl1.text  isEqual: @""])
        {
            //missing info alert
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Store Url or N/A" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else if ([_prodURL2.text  isEqual: @""])
        {
            //missing info alert
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter direct URL or N/A" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else if ([_prodPhone.text  isEqual: @""])
        {
            //missing info alert
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!" message:@"Please Enter Store Pnone Number or N/A" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else
        {
            //save to singleton
            optSingleton.itemName = _prodName.text;
            optSingleton.itemImage = _imageView.image;
            optSingleton.itemDescrip = _prodDescrip.text;
            optSingleton.url1 = _prodUrl1.text;
            optSingleton.url2 = _prodURL2.text;
            optSingleton.itemPhone = _prodPhone.text;
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
    else if (button.tag == 1)
    {
        //close
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (button.tag == 2)
    {
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;

        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
       
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}


@end
