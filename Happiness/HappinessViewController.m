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

- (void)updateHappiness
{
  happiness = (int)([slider value] * 100);
}

-(IBAction) happinessChanged:(UISlider *)ignored
{
  [self updateHappiness];
  [self.faceView setNeedsDisplay];
}

- (float)smileForFaceView:(FaceView *)requestor
{
  return (happiness - 50) / 50.0;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  self.faceView.delegate = self;
  [self updateHappiness];
  [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
