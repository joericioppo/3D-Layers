//
//  AITransformView.m
//  Layers
//
//  Created by test on 3/29/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AITransformView.h"

@implementation AITransformView

@synthesize trackball;

#pragma mark -
#pragma mark Definitions

#define Border_Width 3.0;
#define Corner_Radius 75.0;
#define Layer_Size 150.0


#pragma mark -
#pragma mark Functions

CGFloat DegreesToRadians(CGFloat degrees) 
	{return degrees * M_PI / 180;}


#pragma mark -
#pragma mark Setup

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//		self.multipleTouchEnabled = YES;
        [self setupLayers];		
		self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)setupLayers {
	
	//Root Layer
	rootLayer = [CALayer layer];
	rootLayer.frame = self.bounds;
	[self.layer addSublayer:rootLayer];
	
	CGFloat layerSize = Layer_Size;
	CGRect layerRect = CGRectMake(0.0, 0.0, layerSize, layerSize);
	UIColor *layerColor;
	
	
	//Side One_Front_Blue
	CALayer *sideOne = [CALayer layer];
	layerColor = [UIColor colorWithHue:0.6 saturation:1.0 brightness:1.0 alpha:1.0];
	sideOne.borderColor = layerColor.CGColor;
	layerColor = nil;
	layerColor = [UIColor colorWithHue:0.6 saturation:1.0 brightness:1.0 alpha:0.4];
	sideOne.backgroundColor = layerColor.CGColor;
	sideOne.borderWidth = Border_Width;
	sideOne.cornerRadius = Corner_Radius;
	sideOne.frame = layerRect;
	sideOne.position = self.center;
	
	
	//Side Two_Right_Green
	CALayer *sideTwo = [CALayer layer];
	layerColor = [UIColor colorWithHue:0.25 saturation:1.0 brightness:1.0 alpha:1.0];
	sideTwo.borderColor = layerColor.CGColor;
	layerColor = nil;
	layerColor = [UIColor colorWithHue:0.25 saturation:1.0 brightness:1.0 alpha:0.4];
	sideTwo.backgroundColor = layerColor.CGColor;
	sideTwo.borderWidth = Border_Width;
	sideTwo.cornerRadius = Corner_Radius;

	sideTwo.frame = layerRect;
	sideTwo.position = self.center;
	
	CGFloat degrees = 90.0;
	CGFloat radians = DegreesToRadians(degrees);
	CATransform3D rotation = CATransform3DMakeRotation(radians, 0.0, 1.0, 0.0);
	CATransform3D translation = CATransform3DMakeTranslation(Layer_Size/2, 0.0, Layer_Size/-2);
	CATransform3D position = CATransform3DConcat(rotation, translation);	 
	sideTwo.transform = position;


	//Side Three_Back_Red
	CALayer *sideThree = [CALayer layer];
	layerColor = [UIColor colorWithHue:0.0 saturation:1.0 brightness:1.0 alpha:1.0];
	sideThree.borderColor = layerColor.CGColor;
	layerColor = nil;
	layerColor = [UIColor colorWithHue:0.0 saturation:1.0 brightness:1.0 alpha:0.4];
	sideThree.backgroundColor = layerColor.CGColor;
	sideThree.borderWidth = Border_Width;
	sideThree.cornerRadius = Corner_Radius;
	sideThree.frame = layerRect;
	sideThree.position = self.center;
		
	translation = CATransform3DMakeTranslation(0.0, 0.0, -Layer_Size);
	sideThree.transform = translation;
	
	
	//Side Four_Left_Yellow
	CALayer *sideFour = [CALayer layer];
	layerColor = [UIColor colorWithHue:0.2 saturation:1.0 brightness:1.0 alpha:1.0];
	sideFour.borderColor = layerColor.CGColor;
	layerColor = nil;
	layerColor = [UIColor colorWithHue:0.2 saturation:1.0 brightness:1.0 alpha:0.4];
	sideFour.backgroundColor = layerColor.CGColor;
	sideFour.borderWidth = Border_Width;
	sideFour.cornerRadius = Corner_Radius;
	sideFour.frame = layerRect;
	sideFour.position = self.center;
	
	degrees = 90.0;
	radians = DegreesToRadians(degrees);
	rotation = CATransform3DMakeRotation(radians, 0.0, 1.0, 0.0);
	translation = CATransform3DMakeTranslation(Layer_Size/-2, 0.0, Layer_Size/-2);
	sideFour.transform = CATransform3DConcat(rotation, translation);
				

	//Side Five_Top_Purple
	CALayer *sideFive = [CALayer layer];
	layerColor = [UIColor colorWithHue:0.8 saturation:1.0 brightness:1.0 alpha:1.0];
	sideFive.borderColor = layerColor.CGColor;
	layerColor = nil;
	layerColor = [UIColor colorWithHue:0.8 saturation:1.0 brightness:1.0 alpha:0.4];
	sideFive.backgroundColor = layerColor.CGColor;
	sideFive.borderWidth = Border_Width;
	sideFive.cornerRadius = Corner_Radius;
	sideFive.frame = layerRect;
	sideFive.position = self.center;
	
	degrees = 90.0;
	radians = DegreesToRadians(degrees);
	rotation = CATransform3DMakeRotation(radians, 1.0, .0, 0.0);
	translation = CATransform3DMakeTranslation(0.0, Layer_Size/-2, Layer_Size/-2);
	sideFive.transform = CATransform3DConcat(rotation, translation);
	
	
	//Side Six_Bottom_Orange
	CALayer *sideSix = [CALayer layer];
	layerColor = [UIColor colorWithHue:0.0845 saturation:1.0 brightness:1.0 alpha:1.0];
	sideSix.borderColor = layerColor.CGColor;
	layerColor = nil;
	layerColor = [UIColor colorWithHue:0.0845 saturation:1.0 brightness:1.0 alpha:0.4];
	sideSix.backgroundColor = layerColor.CGColor;
	sideSix.borderWidth = Border_Width;
	sideSix.cornerRadius = Corner_Radius;
	sideSix.frame = layerRect;
	sideSix.position = self.center;
	
	degrees = 90.0;
	radians = DegreesToRadians(degrees);
	rotation = CATransform3DMakeRotation(radians, 1.0, .0, 0.0);
	translation = CATransform3DMakeTranslation(0.0, Layer_Size/2, Layer_Size/-2);
	sideSix.transform = CATransform3DConcat(rotation, translation);	
	
	
	//Transform Layer
	transformLayer = [CATransformLayer layer];
	
	[transformLayer addSublayer:sideOne];
	[transformLayer addSublayer:sideTwo];
	[transformLayer addSublayer:sideThree];
	[transformLayer addSublayer:sideFour];
	[transformLayer addSublayer:sideFive];
	[transformLayer addSublayer:sideSix];

	transformLayer.anchorPointZ = Layer_Size/-2;
		
	[rootLayer addSublayer:transformLayer];
	


//Testing Rotation
/*
	degrees = 60.0;
	radians = DegreesToRadians(degrees);	
	transformLayer.transform = CATransform3DMakeRotation(radians, 0.0, 1.0, 1.0);
	transformLayer.transform = CATransform3DTranslate(transformLayer.transform, 140.0, -175.0, 0.0);
	//or
	[transformLayer setValue:[NSNumber numberWithFloat:radians] forKeyPath:@"transform.rotation.x"];
	[transformLayer setValue:[NSNumber numberWithFloat:radians] forKeyPath:@"transform.rotation.y"];

*/
}


#pragma mark -
#pragma mark Touch Handling

//Molecules Version by Brad Larson - hmm.. not working.
/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSMutableSet *currentTouches = [[[event touchesForView:self] mutableCopy] autorelease];
    [currentTouches minusSet:touches];
	
	// New touches are not yet included in the current touches for the view
	NSSet *totalTouches = [touches setByAddingObjectsFromSet:[event touchesForView:self]];
	if ([totalTouches count] > 1)
	{
		startingTouchDistance = [self distanceBetweenTouches:totalTouches];
		previousScale = 1.0;
	}
	else
	{
		startingLocation = [[touches anyObject] locationInView:self];
	}
	NSLog(@"Previous location is: %@",startingLocation);
	NSLog(@"Previous scale is: %@",previousScale);
	NSLog(@"Starting distance between touches is: %@",startingTouchDistance);
		
}


- (float)distanceBetweenTouches:(NSSet *)touches;
{
	int currentStage = 0;
	CGPoint point1, point2;
	
	
	for (UITouch *currentTouch in touches)
	{
		if (currentStage == 0) 
		{
			point1 = [currentTouch locationInView:self];
			currentStage++;
}
		else if (currentStage == 1) 
		{
			point2 = [currentTouch locationInView:self];
			currentStage++;
		}
		else{
		}
	}
	return (sqrt((point1.x - point2.x) * (point1.x - point2.x) + (point1.y - point2.y) * (point1.y - point2.y)));
}



- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	
	if ([[event touchesForView:self] count] > 1) // Pinch gesture
	{
		// BJL: The following is the pinch-scaling I used in Molecules
		// Scale using pinch gesture
		CGFloat newTouchDistance = [self distanceBetweenTouches:[event touchesForView:self]];
		CGFloat incrementalScaleFactor = (newTouchDistance / startingTouchDistance) / previousScale;
		CATransform3D currentTransform = transformLayer.transform;
		
		CATransform3D scaleTransform = CATransform3DScale(currentTransform, incrementalScaleFactor, incrementalScaleFactor, incrementalScaleFactor);
		transformLayer.transform = scaleTransform;
		previousScale = (newTouchDistance / startingTouchDistance);
		
	}
	else
	{
		CGPoint location = [[touches anyObject] locationInView:self];
		
		// BJL: The following is the code I used in Molecules to do 3-D rotation
		CATransform3D currentTransform = transformLayer.transform;
		CGFloat displacementInX = location.x - startingLocation.x;
		CGFloat displacementInY = startingLocation.y - location.y;
		
		CGFloat totalRotation = sqrt(displacementInX * displacementInX + displacementInY * displacementInY);
		
		CATransform3D rotationalTransform = CATransform3DRotate(currentTransform, totalRotation * M_PI / 180.0, 
																((displacementInX/totalRotation) * currentTransform.m12 + (displacementInY/totalRotation) * currentTransform.m11), 
																((displacementInX/totalRotation) * currentTransform.m22 + (displacementInY/totalRotation) * currentTransform.m21), 
																((displacementInX/totalRotation) * currentTransform.m32 + (displacementInY/totalRotation) * currentTransform.m31));
		startingLocation = location;
		
		transformLayer.transform = rotationalTransform;
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	// BJL: If transitioning from a pinch gesture to a rotation, make sure the starting touch location is set properly
	NSMutableSet *remainingTouches = [[[event touchesForView:self] mutableCopy] autorelease];
    [remainingTouches minusSet:touches];
	if ([remainingTouches count] < 2)
	{
		startingLocation = [[remainingTouches anyObject] locationInView:self];
	}
	
}
*/


//Trackball Version by Bill Dudley
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint location = [[touches anyObject] locationInView:self];
	if(nil == self.trackball) {
		self.trackball = [Trackball trackBallWithLocation:location inRect:self.bounds];
	} else {
		[self.trackball setStartPointFromLocation:location];
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint location = [[touches anyObject] locationInView:self];
	CATransform3D transform = [trackball rotationTransformForLocation:location];
	rootLayer.sublayerTransform = transform;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint location = [[touches anyObject] locationInView:self];
	[self.trackball finalizeTrackBallForLocation:location];
}

#pragma mark -

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
	[rootLayer release];
    [super dealloc];
}


@end
