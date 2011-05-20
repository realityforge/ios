//
//  FaceView.h
//  Happiness
//
//  Created by Peter Donald on 20/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView;

@protocol FaceViewDelegate

// Return -1 (from) => +1 (smile)
- (float)smileForFaceView:(FaceView *)requestor;

@end

@interface FaceView : UIView {
    
  id <FaceViewDelegate> delegate;
  
}

@property (assign) id <FaceViewDelegate> delegate;

@end
