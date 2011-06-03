//
//  PsychologistAppDelegate.h
//  Psychologist
//
//  Created by Peter Donald on 22/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PsychologistAppDelegate : NSObject <UIApplicationDelegate>
{

}

@property(nonatomic, retain) IBOutlet UIWindow *window;
@property(retain) UINavigationController *navigator;
@property(readonly) BOOL iPad;

@end
