//
//  HappinessAppDelegate.h
//  Happiness
//
//  Created by Peter Donald on 20/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HappinessViewController;

@interface HappinessAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HappinessViewController *viewController;

@end
