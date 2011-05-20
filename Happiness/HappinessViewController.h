//
//  HappinessViewController.h
//  Happiness
//
//  Created by Peter Donald on 20/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceView.h"

@interface HappinessViewController : UIViewController <FaceViewDelegate> {
  
  // 0 (sad) to 100 (happy)
  int happiness;   
  
  UISlider *slider;
  FaceView *faceView;
  
}

@property (retain) IBOutlet UISlider *slider;

@property (retain) IBOutlet FaceView *faceView;

-(IBAction) happinessChanged:(UISlider *)ignored;

@end
