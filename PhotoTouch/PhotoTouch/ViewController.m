//
//  ViewController.m
//  PhotoTouch
//
//  Created by Divakar Y N on 28/10/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *soundUrl = [[NSBundle mainBundle] URLForResource:@"click" withExtension:@"aiff"];
    //AudioServicesCreateSystemSoundID(soundUrl, &mySound);(this gives an error bcoz it requires CFURLto be used which available in C, hence bridge it by using CFURL)
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundUrl, &mySound);
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidUnload
{
    [self viewDidUnload];
    AudioServicesDisposeSystemSoundID(mySound);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonPressed:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

-(void) panGestureRecognized:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint newPoint = [gestureRecognizer locationInView:[self view]];
    [[self view] bringSubviewToFront:[gestureRecognizer view]];
    [[gestureRecognizer view] setCenter:newPoint];
}

-(void) tapGestureRecognized:(UITapGestureRecognizer *)gestureRecognizer
{
    [[self view] bringSubviewToFront:[gestureRecognizer view]];
    
    [UIView animateWithDuration:0.2 animations:^{
       
        [[gestureRecognizer view] setBounds:CGRectMake(0, 0, 100, 100)];
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            [[gestureRecognizer view] setBounds:CGRectMake(0, 0, 80, 80)];
        }];
    }];
}
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageView *newImageView = [[UIImageView alloc] initWithImage:image];
    [newImageView setFrame:CGRectMake(-80, -80, 80, 80)];
    [newImageView setUserInteractionEnabled:YES];
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)];
    [newImageView addGestureRecognizer:panGestureRecognizer];
    
    UITapGestureRecognizer *tapGuestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    [newImageView addGestureRecognizer:tapGuestureRecognizer];
    
    //[[self view] addSubview:newImageView]; (later v r using it inside the block)
    [self dismissViewControllerAnimated:YES completion:^{
       
        AudioServicesPlaySystemSound(mySound);
        
        [[self view] addSubview:newImageView];
        
        [UIView animateWithDuration:0.2 animations: ^{
            [newImageView setFrame:CGRectMake(arc4random_uniform(240), arc4random_uniform(300), 80, 80)];
        }];
       // [newImageView setAlpha:0.5];(to make the image blur)
    }];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
