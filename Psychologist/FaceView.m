//
//  FaceView.m
//  Happiness
//
//  Created by Peter Donald on 20/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FaceView.h"


@implementation FaceView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawCircleAtX:(CGFloat)x Y:(CGFloat)y withRadius:(CGFloat)radius onContext:(CGContextRef)context
{
  UIGraphicsPushContext(context);
  CGContextBeginPath(context);
  CGContextAddArc(context, x, y, radius, 0, 2 * M_PI, YES);
  CGContextDrawPath(context, kCGPathFillStroke);
  CGContextFillPath(context);
  UIGraphicsPopContext();
}

- (void)drawFaceAtX:(CGFloat)x Y:(CGFloat)y withRadius:(CGFloat)radius onContext:(CGContextRef)context
{
  UIGraphicsPushContext(context);
  
  [[UIColor yellowColor] setFill];
  CGContextSetLineWidth(context, 4);

  [self drawCircleAtX:x Y:y withRadius:radius onContext:context];
  
#define EYE_X_RATIO 0.35
#define EYE_Y_RATIO 0.35
#define EYE_RADIUS 0.1

  [[UIColor blackColor] setFill];

  CGFloat eyeLevel = y - (EYE_Y_RATIO * radius);
  CGFloat halfEyeSeparation = (EYE_X_RATIO * radius);
  
  [self drawCircleAtX:(x - halfEyeSeparation) 
                    Y:eyeLevel 
           withRadius:(radius * EYE_RADIUS) 
            onContext:context];
  
  [self drawCircleAtX:(x + halfEyeSeparation) 
                    Y:eyeLevel
           withRadius:(radius * EYE_RADIUS) 
            onContext:context];

#define MOUTH_X_RATIO 0.55
#define MOUTH_Y_RATIO 0.4
#define MOUTH_SMILE 0.25

  CGFloat mouthLevel = y + (MOUTH_Y_RATIO * radius);
  CGFloat halfMouthWidth = MOUTH_X_RATIO * radius;
  
  CGContextMoveToPoint(context, x - halfMouthWidth, mouthLevel);
  
  CGFloat smileOffset = MOUTH_SMILE * radius * [self.delegate smileForFaceView:self];
  
  CGContextAddCurveToPoint(context, 
                           (x - halfMouthWidth * 2/3), mouthLevel + smileOffset, 
                           (x + halfMouthWidth * 2/3), mouthLevel + smileOffset, 
                           (x + halfMouthWidth), mouthLevel);
  CGContextStrokePath(context);

  UIGraphicsPopContext();
}

- (void)drawRect:(CGRect)rect
{
  CGFloat x = self.bounds.origin.x + self.bounds.size.width/2;
  CGFloat y = self.bounds.origin.y + self.bounds.size.height/2;
  
  CGFloat shortDimension;
  if (self.bounds.size.width > self.bounds.size.height) 
  {
    shortDimension = self.bounds.size.height;
  } 
  else
  {
    shortDimension = self.bounds.size.width;    
  }
#define RADIUS_RATIO 0.9
  
  CGFloat radius = (shortDimension / 2) * RADIUS_RATIO;
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  UIGraphicsPushContext(context);

  [self drawFaceAtX:x Y:y withRadius:radius onContext:context];
  
  UIGraphicsPopContext();  
}

- (void)dealloc
{
    [super dealloc];
}

@end
