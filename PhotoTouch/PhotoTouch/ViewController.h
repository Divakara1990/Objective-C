//
//  ViewController.h
//  PhotoTouch
//
//  Created by Divakar Y N on 28/10/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolBox/AudioToolBox.h>
//CGPoint newPoint;

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>{

    SystemSoundID mySound;
}

- (IBAction)addButtonPressed:(id)sender;
//-(void) panGestureRecognized:(UIPanGestureRecognizer *)gestureRecognizer;

@end

