//
//  PsychologistAppDelegate.m
//  Psychologist
//
//  Created by Peter Donald on 22/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PsychologistAppDelegate.h"
#import "PsychologistViewController.h"

@implementation PsychologistAppDelegate


@synthesize window = _window;
@synthesize navigator = _navigator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  UINavigationController *controller = [[UINavigationController alloc] init];

  PsychologistViewController *psychController = [[PsychologistViewController alloc] init];
  [controller pushViewController:psychController animated:NO];

  if (self.iPad)
  {
    UISplitViewController *splitViewController = [[UISplitViewController alloc] init];
    UINavigationController *rightNav = [[UINavigationController alloc] init];
    [rightNav pushViewController:psychController.happinessViewController animated:NO];
    splitViewController.delegate = psychController.happinessViewController;
    splitViewController.viewControllers = [NSArray arrayWithObjects:controller, rightNav, nil];
    [self.window addSubview:splitViewController.view];
    [rightNav release];
    //self.navigator = splitViewController;
    //[splitViewController release];
  }
  else
  {
    self.navigator = controller;
    [self.window addSubview:controller.view];
  }

  [psychController release];
  [controller release];

  [self.window makeKeyAndVisible];
  return YES;
}

- (BOOL)iPad
{
  return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

- (void)dealloc
{
  [self.navigator release];
  [_window release];
  [super dealloc];
}

@end
