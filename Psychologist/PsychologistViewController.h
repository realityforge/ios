//
//  PsychologistViewController.h
//  Psychologist
//
//  Created by Peter Donald on 22/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HappinessViewController.h"

@interface PsychologistViewController : UIViewController
{
  HappinessViewController *_happinessViewController;
}

@property(readonly, nonatomic) HappinessViewController *happinessViewController;

- (IBAction)happy;

- (IBAction)sad;

- (IBAction)soso;


@end
