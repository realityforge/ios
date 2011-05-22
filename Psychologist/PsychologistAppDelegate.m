//
//  PsychologistAppDelegate.m
//  Psychologist
//
//  Created by Peter Donald on 22/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PsychologistAppDelegate.h"

@implementation PsychologistAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Override point for customization after application launch.
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)dealloc
{
  [_window release];
  [super dealloc];
}

@end
