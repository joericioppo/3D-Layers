//
//  TrackBall.m
//  PhotoCube3D
//
//  Created by Bill Dudney on 10/17/08.
//  Copyright 2008 Gala Factory. All rights reserved.
//

#import "TrackBall.h"

#include <math.h>

static const float kTol = 0.001;

@implementation Trackball

+ (id)trackBallWithLocation:(CGPoint)location inRect:(CGRect)bounds {
  return [[[self alloc] initWithLocation:location inRect:bounds] autorelease];
}

- (id)initWithLocation:(CGPoint)location inRect:(CGRect)bounds {
  self = [super init];
  if(nil != self) {
    baseTransform = CATransform3DIdentity;
    // radius is half the smaller of width or height
    if(CGRectGetWidth(bounds) > CGRectGetHeight(bounds)) {
      trackBallRadius = CGRectGetHeight(bounds) * 0.5f;
    } else {
      trackBallRadius = CGRectGetWidth(bounds) * 0.5f;
    }

    // trackball center is center of bounds
    trackBallCenter.x = CGRectGetMidX(bounds);
    trackBallCenter.y = CGRectGetMidY(bounds);

    [self setStartPointFromLocation:location];
  }
  return self;
}

- (void)setStartPointFromLocation:(CGPoint)location {
  // start point is the location from the center and calculated z point
  trackBallStartPoint[0] = location.x - trackBallCenter.x;
  trackBallStartPoint[1] = location.y - trackBallCenter.y;
  CGFloat dist = trackBallStartPoint[0] * trackBallStartPoint[0] + trackBallStartPoint[1] * trackBallStartPoint[1];
  
  if(dist > trackBallRadius * trackBallRadius) {
    // outside the center of the sphere so make it zero
    trackBallStartPoint[2] = 0.0f;
  } else {
    // in the sphere so the z is the other side of the triangle
    trackBallStartPoint[2] = sqrt(trackBallRadius * trackBallRadius - dist);
  }
}

- (void)finalizeTrackBallForLocation:(CGPoint)location {
  baseTransform = [self rotationTransformForLocation:location];
}

- (CATransform3D)rotationTransformForLocation:(CGPoint)location {  
  CGFloat trackBallCurrentPoint[3] = {location.x - trackBallCenter.x, 
  location.y - trackBallCenter.y, 0.0f};
  if(fabs(trackBallCurrentPoint[0] - trackBallStartPoint[0]) < kTol && 
     fabs(trackBallCurrentPoint[1] - trackBallStartPoint[1]) < kTol) {
    return CATransform3DIdentity;
  }
  
  CGFloat dist = trackBallCurrentPoint[0] * trackBallCurrentPoint[0] + 
    trackBallCurrentPoint[1] * trackBallCurrentPoint[1];
  if(dist > trackBallRadius * trackBallRadius) {
    // outside the center of the sphere so make it zero
    trackBallCurrentPoint[2] = 0.0f;
  } else {
    trackBallCurrentPoint[2] = sqrt(trackBallRadius * trackBallRadius - dist);
  }
  
  // cross product yields the rotation vector
  CGFloat rotationVector[3];
  rotationVector[0] =  trackBallStartPoint[1] * trackBallCurrentPoint[2] - 
  trackBallStartPoint[2] * trackBallCurrentPoint[1];
  rotationVector[1] = -trackBallStartPoint[0] * trackBallCurrentPoint[2] +
  trackBallStartPoint[2] * trackBallCurrentPoint[0];
  rotationVector[2] =  trackBallStartPoint[0] * trackBallCurrentPoint[1] - 
  trackBallStartPoint[1] * trackBallCurrentPoint[0];
  
  // calc the angle between the current point vector and the starting point vector
  // use arctan so we get all eight quadrants instead of just the positive ones
  
  // cos(a) = (start . current) / (||start|| ||current||)
  // sin(a) = (||start X current||) / (||start|| ||current||)
  // a = atan2(sin(a), cos(a))
  CGFloat startLength = sqrt(trackBallStartPoint[0] * trackBallStartPoint[0] + trackBallStartPoint[1] * trackBallStartPoint[1] + trackBallStartPoint[2] * trackBallStartPoint[2]);
  CGFloat currentLength = sqrt(trackBallCurrentPoint[0] * trackBallCurrentPoint[0] + trackBallCurrentPoint[1] * trackBallCurrentPoint[1] + trackBallCurrentPoint[2] * trackBallCurrentPoint[2]);
  CGFloat startDotCurrent = trackBallStartPoint[0] * trackBallCurrentPoint[0] + trackBallStartPoint[1] * trackBallCurrentPoint[1] + trackBallStartPoint[2] * trackBallCurrentPoint[2]; // (start . current)
  // start X current we have already calcualted in the rotation vector
  CGFloat rotationLength = sqrt(rotationVector[0] * rotationVector[0] + rotationVector[1] * rotationVector[1] + rotationVector[2] * rotationVector[2]);
  
  CGFloat angle = atan2(rotationLength / (startLength * currentLength), startDotCurrent / (startLength * currentLength));
  
  // normalize the rotation vector
  rotationVector[0] = rotationVector[0] / rotationLength;
  rotationVector[1] = rotationVector[1] / rotationLength;
  rotationVector[2] = rotationVector[2] / rotationLength;
  
  CATransform3D rotationTransform = CATransform3DMakeRotation(angle, rotationVector[0], rotationVector[1], rotationVector[2]);
  return CATransform3DConcat(baseTransform, rotationTransform);
}

@end
