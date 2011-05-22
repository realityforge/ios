//
//  HappinessViewController.m
//  Happiness
//
//  Created by Peter Donald on 20/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HappinessViewController.h"

@implementation HappinessViewController

@synthesize slider;
@synthesize faceView;
@synthesize happiness;

-(void)updateUIForHappinessChange
{
  self.slider.value = happiness / 100.0;
  [self.faceView setNeedsDisplay];
}

- (void)setHappiness:(int)value
{
  if( value < 0 ) value = 0;
  if( value > 100 ) value = 100;
  happiness = value;
  [self updateUIForHappinessChange];
}

-(IBAction) happinessChanged:(UISlider *)ignored
{
  self.happiness = (int)([slider value] * 100);
}

- (float)smileForFaceView:(FaceView *)requestor
{
  return (self.happiness - 50) / 50.0;
}

// Must be called during deallocation or unloading to release outlets
- (void)releaseOutlets
{
  self.faceView = nil;
  self.slider = nil;
}

- (void)dealloc
{
  [self releaseOutlets];
  [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.faceView.delegate = self;
  [self updateUIForHappinessChange];
}

- (void)viewDidUnload
{
  [self releaseOutlets];
  [super viewDidUnload];
}

@end
