//
//  PsychologistViewController.m
//  Psychologist
//
//  Created by Peter Donald on 22/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PsychologistViewController.h"

@implementation PsychologistViewController

- (void)showDiagnosis:(int)happinessLevel
{
  _happinessViewController.happiness = happinessLevel;
  _happinessViewController.title = @"Diagnosis";

  // If the happiness controller is not on screen then put it there (otherwise we are on the iPad)
  if (nil == self.happinessViewController.view.window)
  {
    [self.navigationController pushViewController:self.happinessViewController animated:YES];
  }
}

- (HappinessViewController *)happinessViewController
{
  if (!_happinessViewController)
  {
    _happinessViewController = [[HappinessViewController alloc] init];
  }
  return _happinessViewController;
}

- (IBAction)happy
{
  [self showDiagnosis:100];
}

- (IBAction)sad
{
  [self showDiagnosis:0];
}

- (IBAction)soso
{
  [self showDiagnosis:50];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"Psychologist";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
  return YES;
}

- (void)dealloc
{
  [_happinessViewController release];
  [super dealloc];
}

@end
