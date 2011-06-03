//
//  PsychologistViewController.m
//  Psychologist
//
//  Created by Peter Donald on 22/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PsychologistViewController.h"
#import "HappinessViewController.h"


@implementation PsychologistViewController

- (void)showDiagnosis:(int)happinessLevel
{
  HappinessViewController* controller = [[HappinessViewController alloc] init];
  controller.happiness = happinessLevel;
  controller.title = @"Diagnosis";

  [self.navigationController pushViewController:controller animated:YES];
  [controller release];
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


@end
