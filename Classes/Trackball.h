//
//  TrackBall.h
//  PhotoCube3D
//
//  Created by Bill Dudney on 10/17/08.
//  Copyright 2008 Gala Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

/*
 * Trackball - place an imaginary sphere around your scene and let
 *  users move the scene around with their finger/mouse.
 *
 * How it works:
 *
 * Imagine a sphere, centered on a 3D scene, you can roll the 
 * sphere by touching its surface and moving your finger.
 *
 * The initial touch sets up a vector between the center of the sphere and
 * the touch point. A second vector is calculated between the current touch point
 * and the center of the sphere.
 *
 * The cross product of these two vectors gives the vector we are rotating
 * around and the angle between the two vectors gives the amount.
 */
@interface Trackball : NSObject {
  CATransform3D baseTransform;
  CGFloat trackBallRadius;
  CGFloat trackBallStartPoint[3];
  CGPoint trackBallCenter;
}

// returns an autoreleased trackball
+ (id)trackBallWithLocation:(CGPoint)location inRect:(CGRect)bounds;

// set the starting point of the first touch to location
// and setup the trackball to be centered in a cube around bounds
// where the min of height & width determine the radius of the sphere
- (id)initWithLocation:(CGPoint)location inRect:(CGRect)bounds;

// set the start point, call this on subsequent taps (i.e on touchesBegan 
// after first initialization)
- (void)setStartPointFromLocation:(CGPoint)location;

// call this to get the trackball to remember where it is
// typically you will call this from touchesEnded:
- (void)finalizeTrackBallForLocation:(CGPoint)location;

// calculate the tranformation matrix based on current location
// you typically call this from touchesMoved:
- (CATransform3D)rotationTransformForLocation:(CGPoint)location;

@end
